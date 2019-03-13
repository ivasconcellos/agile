class Artefato < ApplicationRecord
	belongs_to :tema_curso
	has_many :artefatos_alunos

	has_one_attached :imagem
	validates :imagem, attached: true, size: { less_than: 10.megabytes, 
		message: 'Imagem muito grande. Máximo de 10 MB.' }, 
		content_type: [ "image/png", "image/jpg", "image/jpeg"] 
	
	validates_presence_of :nome, :pontos_requeridos
	
	self.per_page = 10

	def self.verifica_artefato(usuario)
		@artefato = Artefato.where('pontos_requeridos <= ?', usuario.pontos_experiencia)
		for artefato in @artefato
			@artefato_aluno = ArtefatoAluno.find_by(usuario_curso_id: usuario.id, artefato_id: artefato.id)
		    if !@artefato_aluno
		    	if usuario.pontos_experiencia >= artefato.pontos_requeridos
		    		ArtefatoAluno.create!(usuario_curso_id: usuario.id, artefato_id: artefato.id)
		    	end
		    end
		end
	end
end
