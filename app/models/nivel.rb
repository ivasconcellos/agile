class Nivel < ApplicationRecord
	has_one_attached :imagem
	validates :imagem, attached: true, size: { less_than: 10.megabytes , message: 'Imagem muito grande. Máximo de 10 MB.' }
	validates :imagem, attached: true, content_type: [ "image/png", "image/jpg", "image/jpeg"] 
	validates_presence_of :nome, :pontos_requeridos

	self.per_page = 10
end
