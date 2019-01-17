class AvaliacaoTarefa < ApplicationRecord
  belongs_to :tarefa_aluno
  belongs_to :usuario_curso
end
