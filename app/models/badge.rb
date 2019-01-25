class Badge < ApplicationRecord
	has_one_attached :imagem
	validates_presence_of :nome, :imagem
	self.per_page = 10
end
