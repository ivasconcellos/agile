class Conteudo < ApplicationRecord
  validates_presence_of :nome, :curso_id
  belongs_to :curso
end
