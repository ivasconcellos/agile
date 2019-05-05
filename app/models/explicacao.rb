class Explicacao < ApplicationRecord
  belongs_to :modulo

  validates_presence_of :nome, :descricao
  
  self.per_page = 10

  after_create :ordenacao
  after_destroy :remocao

  def ordenacao
    ModuloOrdenacao.ordenar(self)
  end

  def remocao
    ModuloOrdenacao.remover(self)
  end
end
