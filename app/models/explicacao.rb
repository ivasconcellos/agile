class Explicacao < ApplicationRecord
  belongs_to :modulo

  validates_presence_of :nome, :descricao
  
  self.per_page = 10

  after_create :ordenacao

  def ordenacao
    ModuloOrdenacao.ordenar(self)
  end
end
