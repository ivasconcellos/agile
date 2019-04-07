class Grupo < ApplicationRecord
  has_many :grupos_cursos, :dependent => :destroy, :dependent => :restrict_with_error
  has_many :avatares, :dependent => :destroy, :dependent => :restrict_with_error

  has_one_attached :imagem
  
  validates :imagem, attached: true, size: { less_than: 10.megabytes, 
		message: 'Imagem muito grande. O tamanho máximo deve ser 10 MB.' }, 
		content_type: [ "image/png", "image/jpg", "image/jpeg"] 
		
  validates_presence_of :nome, :perfil

  self.per_page = 10
end
