class AlunoRespostum < ApplicationRecord
  belongs_to :aluno_curso
  belongs_to :respostas_perguntas
end
