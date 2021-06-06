class Nivel < ApplicationRecord
	has_one_attached :imagem
	
	validates :imagem, attached: true, size: { less_than: 10.megabytes, 
		message: 'Imagem muito grande. O tamanho máximo deve ser 10 MB.' }, 
		content_type: [ "image/png", "image/jpg", "image/jpeg"] 
		
	validates_presence_of :nome, :pontos_requeridos

	self.per_page = 10

	def self.verifica_nivel(usuario)
		@nivel = Nivel.where('pontos_requeridos <= ?', usuario.pontos_experiencia).last
	    if usuario.nivel_id != @nivel.id
	      usuario.nivel_id = @nivel.id
				usuario.save!
				ApplicationMailer.novo_nivel(usuario).deliver	      
				@notificacao = Notificacao.create!(usuario_curso_id: usuario.id, texto: "Parabéns!!! Você conquistou o Nível: <b>" + @nivel.nome + "</b>! Para visualizá-lo, acesse o menu 'Conquistas'.", tipo: "Nível")
	    end
	end
end
