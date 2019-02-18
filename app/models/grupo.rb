class Grupo < ApplicationRecord
  has_many :grupos_cursos, :dependent => :destroy, :dependent => :restrict_with_error
  
  has_one_attached :imagem
  validates :imagem, attached: true

  validates_presence_of :nome

  self.per_page = 10
end
