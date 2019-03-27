class Dialogo < ApplicationRecord
  belongs_to :usuario_curso
  belongs_to :modulo

  validates_presence_of :nome, :texto

  after_create :ordenacao

  def ordenacao
    ModuloOrdenacao.ordenar(self)
  end
end
