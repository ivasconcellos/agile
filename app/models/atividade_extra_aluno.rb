class AtividadeExtraAluno < ApplicationRecord
  belongs_to :aluno, :class_name => "UsuarioCurso"
  belongs_to :professor, :class_name => "UsuarioCurso"
  belongs_to :atividade_extra
  validates_presence_of :pontuacao 
  validate :verificar_pontuacao_maxima

  def pontuacao_aluno pontuacao
    
    @usuario = UsuarioCurso.find_by(id: self.aluno_id)
    if pontuacao
      @usuario.pontos_experiencia = @usuario.pontos_experiencia - pontuacao + self.pontuacao
    else
      @usuario.pontos_experiencia += self.pontuacao
    end
    @usuario.save
    
    Nivel.verifica_nivel(@usuario)
    Badge.verifica_badge(@usuario)
    Artefato.verifica_artefato(@usuario)
  end

  private

	def verificar_pontuacao_maxima
    if self.pontuacao
  		if self.pontuacao > self.atividade_extra.pontuacao
        errors.add(:pontuacao, " atribuída ao aluno superior a nota máxima estabelecida para esta atividade!" )
        errors.add(atividade_extra.pontuacao.to_s, " é nota máxima permitida!"  )
  		end
    end
  end

end
