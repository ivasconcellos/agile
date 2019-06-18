class AtividadeExtraAluno < ApplicationRecord
  belongs_to :aluno, :class_name => "UsuarioCurso"
  belongs_to :professor, :class_name => "UsuarioCurso"
  belongs_to :atividade_extra
  validate :verificar_pontuacao_maxima

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
