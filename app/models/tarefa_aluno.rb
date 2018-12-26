class TarefaAluno < ApplicationRecord
  belongs_to :tarefa
  belongs_to :usuario_curso
end
