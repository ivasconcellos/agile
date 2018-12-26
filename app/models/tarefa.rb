class Tarefa < ApplicationRecord
  belongs_to :conteudo
  belongs_to :usuario_curso
  has_many :tarefa_aluno
end
