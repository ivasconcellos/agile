class Grupo < ApplicationRecord

  has_one_attached :imagem
  validates_presence_of :nome, :descricao
  self.per_page = 10
end
