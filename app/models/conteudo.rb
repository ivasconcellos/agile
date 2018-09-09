class Conteudo < ApplicationRecord
  validates_presence_of :nome, :curso_id
  belongs_to :curso
  has_many :materiais
  self.per_page = 10
end
