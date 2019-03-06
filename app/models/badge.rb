class Badge < ApplicationRecord
	has_many :badges_alunos, :dependent => :destroy, :dependent => :restrict_with_error
	
	has_one_attached :imagem
	
	validates :imagem, attached: true, size: { less_than: 10.megabytes, 
		message: 'Imagem muito grande. Máximo de 10 MB.' }, 
		content_type: [ "image/png", "image/jpg", "image/jpeg"] 
		
	validates_presence_of :nome

	self.per_page = 10
end
