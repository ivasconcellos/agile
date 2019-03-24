class TemaCurso < ApplicationRecord
	has_many :artefatos
	
	has_one_attached :imagem
	
	validates_presence_of :nome, :cor_titulo, :cor_texto, :cor_fundo
	
	validates :imagem, attached: true, size: { less_than: 10.megabytes, 
		message: 'Imagem muito grande. O tamanho máximo deve ser 10 MB.' }, 
		content_type: [ "image/png", "image/jpg", "image/jpeg"] 
		
	self.per_page = 10
end
