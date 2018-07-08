class Explicacao < ApplicationRecord
  belongs_to :conteudo
  validates_presence_of :nome
  self.per_page = 10
end
