class TemaCurso < ApplicationRecord
	validates_presence_of :nome, :cor_titulo, :cor_texto, :cor_fundo, :imagem

	has_one_attached :imagem
	validates :imagem, attached: true
			
	self.per_page = 10
end
