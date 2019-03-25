class Badge < ApplicationRecord
	has_many :badges_alunos, :dependent => :destroy, :dependent => :restrict_with_error
	
	has_one_attached :imagem
	
	validates :imagem, attached: true, size: { less_than: 10.megabytes, 
		message: 'Imagem muito grande. O tamanho máximo deve ser 10 MB.' }, 
		content_type: [ "image/png", "image/jpg", "image/jpeg"] 
		
	validates_presence_of :nome, :pontos_requeridos

	self.per_page = 10

	def self.verifica_badge(usuario)
		@badge = Badge.where('pontos_requeridos <= ?', usuario.pontos_experiencia)
		for badge in @badge
			@badge_aluno = BadgeAluno.find_by(usuario_curso_id: usuario.id, badge_id: badge.id)
		    if !@badge_aluno
		    	if usuario.pontos_experiencia >= badge.pontos_requeridos
		    		@nova_badge = BadgeAluno.create!(usuario_curso_id: usuario.id, badge_id: badge.id)
		    		ApplicationMailer.nova_badge(@nova_badge).deliver
		    	end
		    end
		end
	end
end
