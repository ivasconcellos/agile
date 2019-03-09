class AlunoResposta < ApplicationRecord
  belongs_to :usuario_curso
  belongs_to :resposta_pergunta
end
