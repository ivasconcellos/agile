class AvaliacaoTarefa < ApplicationRecord
  belongs_to :tarefa_aluno
  belongs_to :usuario_curso

  validates :tarefa_aluno, uniqueness: { scope: :usuario_curso }

  validates_presence_of :nota

  validate :verificar_pontuacao_maxima

  validates_inclusion_of :nota, :in => 0..100, message: " - A pontuação deve ser entre 1 e 100"

  private

	def verificar_pontuacao_maxima
		tarefa = 
		if self.nota > self.tarefa_aluno.tarefa.missao.pontuacao
			errors.add(:nota, " - Nota atribuída ao aluno superior a nota máxima estabelecida para esta tarefa!")
		end
	    
	end
end
