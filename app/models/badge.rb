class Badge < ApplicationRecord
	has_one_attached :imagem
	validates :imagem, attached: true
	
	validates_presence_of :nome

	self.per_page = 10
end
