class Nivel < ApplicationRecord
	self.per_page = 10
	has_one_attached :imagem
	validates_presence_of :nome, :pontos_requeridos, :imagem
end
