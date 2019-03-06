class Dica < ApplicationRecord
  belongs_to :missao

  validates_presence_of :nome, :descricao

  self.per_page = 10

end
