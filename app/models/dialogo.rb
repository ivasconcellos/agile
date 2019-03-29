class Dialogo < ApplicationRecord
  belongs_to :usuario_curso
  belongs_to :modulo

  validates_presence_of :nome, :texto

  after_create :ordenacao
  after_destroy :remocao
  
  def ordenacao
    ModuloOrdenacao.ordenar(self)
  end

  def remocao
    ModuloOrdenacao.remover(self)
  end
end
