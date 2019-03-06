class TemaCurso < ApplicationRecord
	validates_presence_of :nome, :cor_titulo, :cor_texto, :cor_fundo, :imagem

	has_one_attached :imagem
	
	validates :imagem, attached: true, size: { less_than: 10.megabytes, 
		message: 'Imagem muito grande. Máximo de 10 MB.' }, 
		content_type: [ "image/png", "image/jpg", "image/jpeg"] 
		
	self.per_page = 10
end
