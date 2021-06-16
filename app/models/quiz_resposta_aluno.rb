class QuizRespostaAluno < ApplicationRecord
  belongs_to :usuario_curso
  belongs_to :quiz_pergunta_resposta
  has_one :quiz_pergunta, :through =>  :quiz_pergunta_resposta
  belongs_to :quiz

  def pontuacao_aluno
  	@usuario = UsuarioCurso.find_by(id: self.usuario_curso_id)
    if self.quiz_pergunta_resposta.correta?
      Nivel.verifica_nivel(@usuario)
      Badge.verifica_badge(@usuario)
      Artefato.verifica_artefato(@usuario)
    end    
  end

  validate :unica_resposta

  private

  def unica_resposta
  	if self.quiz_pergunta_resposta
	  	@resposta = QuizRespostaAluno.joins(:quiz_pergunta_resposta).where(
	  		'usuario_curso_id = ? and quiz_pergunta_respostas.quiz_pergunta_id = ?',
	  		 self.usuario_curso_id, self.quiz_pergunta_resposta.quiz_pergunta.id)
	  	if !@resposta.empty?
	  		errors.add(:resposta, " - Você já resposdeu a esta Pergunta!")
	  	end
	  end
  end

end
