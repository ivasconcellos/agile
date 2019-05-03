class Recompensa < ApplicationRecord
  belongs_to :usuario_curso
  belongs_to :curso

  validates_presence_of :nome, :posicao_ranking
end
