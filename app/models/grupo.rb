class Grupo < ApplicationRecord
  has_many :grupos_cursos, :dependent => :destroy, :dependent => :restrict_with_error
  has_many :avatares, :dependent => :destroy, :dependent => :restrict_with_error

  has_one_attached :imagem
  validates :imagem, attached: true, size: { less_than: 10.megabytes , message: 'Imagem muito grande. Máximo de 10 MB.' }

  validates_presence_of :nome

  self.per_page = 10
end
