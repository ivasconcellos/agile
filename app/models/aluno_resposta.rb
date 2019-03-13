class AlunoResposta < ApplicationRecord
  belongs_to :usuario_curso
  belongs_to :resposta_pergunta

  def pontuacao_aluno
  	@usuario = UsuarioCurso.find_by(id: self.usuario_curso_id)
    if self.resposta_pergunta.correta?
      @usuario.pontos_experiencia += self.resposta_pergunta.pergunta_quiz.pontuacao
      Nivel.verifica_nivel(@usuario)
      Badge.verifica_badge(@usuario)
    end
    @usuario.save  
    
  end

  validate :unica_resposta

  private

  def unica_resposta
  	if self.resposta_pergunta
	  	@resposta = AlunoResposta.joins(:resposta_pergunta).where(
	  		'usuario_curso_id = ? and respostas_perguntas.pergunta_quiz_id = ?',
	  		 self.usuario_curso_id, self.resposta_pergunta.pergunta_quiz.id)
	  	if !@resposta.empty?
	  		errors.add(:resposta, " - Você já resposdeu a esta Pergunta!")
	  	end
	  end
  end

end
