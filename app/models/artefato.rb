class Artefato < ApplicationRecord
	belongs_to :tema_curso
	has_many :artefatos_alunos

	has_one_attached :imagem
	validates :imagem, attached: true, size: { less_than: 10.megabytes, 
		message: 'Imagem muito grande. O tamanho máximo deve ser 10 MB.' }, 
		content_type: [ "image/png", "image/jpg", "image/jpeg"] 
	
	validates_presence_of :nome, :pontos_requeridos
	
	self.per_page = 10

	def self.verifica_artefato(usuario)
		pontuacao_aluno = usuario.pontuacao
		@artefato = Artefato.where('pontos_requeridos <= ?', pontuacao_aluno)
		for artefato in @artefato
			@artefato_aluno = ArtefatoAluno.find_by(usuario_curso_id: usuario.id, artefato_id: artefato.id)
		    if !@artefato_aluno
		    	if pontuacao_aluno >= artefato.pontos_requeridos
					@novo_artefato = ArtefatoAluno.create!(usuario_curso_id: usuario.id, artefato_id: artefato.id)
					@notificacao = Notificacao.create!(usuario_curso_id: usuario.id, texto: "Parabéns!!! Você conquistou o artefato: <b>" + @novo_artefato.artefato.nome + "</b>! Para visualizá-lo, acesse o menu 'Conquistas'.", tipo: "Artefato")
					ApplicationMailer.novo_artefato(@novo_artefato).deliver		    		
		    	end
		    end
		end
	end
end
