class Nivel < ApplicationRecord
	has_one_attached :imagem
	
	validates :imagem, attached: true, size: { less_than: 10.megabytes, 
		message: 'Imagem muito grande. Máximo de 10 MB.' }, 
		content_type: [ "image/png", "image/jpg", "image/jpeg"] 
		
	validates_presence_of :nome, :pontos_requeridos

	self.per_page = 10

	def self.verifica_nivel(usuario)
		@nivel = Nivel.where('pontos_requeridos <= ?', usuario.pontos_experiencia).last
	    if usuario.pontos_experiencia >= @nivel.pontos_requeridos
	      usuario.nivel_id = @nivel.id
	      usuario.save!
	    end
	end
end
