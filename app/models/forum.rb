class Forum < ApplicationRecord
  has_many :foruns_comentarios, :dependent => :destroy, :dependent => :restrict_with_error
  belongs_to :usuario_curso
  belongs_to :modulo, optional: true

  validates_presence_of :titulo, :descricao, :modulo_id
  
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
