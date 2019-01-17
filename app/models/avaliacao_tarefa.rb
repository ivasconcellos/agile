class AvaliacaoTarefa < ApplicationRecord
  belongs_to :tarefa_aluno
  belongs_to :usuario_curso

  validates :tarefa_aluno, uniqueness: { scope: :usuario_curso }

  validates_presence_of :nota
end
