class Material < ApplicationRecord
  belongs_to :conteudo
  validates_presence_of :nome, :descricao
  self.per_page = 10
end
