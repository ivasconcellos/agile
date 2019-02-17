class Nivel < ApplicationRecord
	has_one_attached :imagem
	validates :imagem, attached: true

	validates_presence_of :nome, :pontos_requeridos

	self.per_page = 10
end
