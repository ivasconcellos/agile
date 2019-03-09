class AlunoResposta < ApplicationRecord
  belongs_to :usuario_curso
  belongs_to :resposta_pergunta

  validates :usuario_curso, uniqueness: { scope: :resposta_pergunta }
end
