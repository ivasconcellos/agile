class UsuarioCurso < ApplicationRecord
	validates_presence_of :perfil, :nickname
	belongs_to :curso
	belongs_to :usuario
	belongs_to :avatar, optional: true
	has_many :tarefas, :dependent => :destroy, :dependent => :restrict_with_error
	has_many :tarefa_aluno, :dependent => :destroy, :dependent => :restrict_with_error
	has_many :tarefa_avaliacao, :dependent => :destroy, :dependent => :restrict_with_error
	# belongs_to :usuario
	has_many :quizzes, :dependent => :destroy, :dependent => :restrict_with_error
	has_many :salas_chat, :dependent => :destroy, :dependent => :restrict_with_error
	has_many :mensagens, :dependent => :destroy, :dependent => :restrict_with_error
	belongs_to :grupo_curso, optional: true
	belongs_to :nivel, optional: true
	has_many :missoes, :dependent => :destroy, :dependent => :restrict_with_error
	has_many :foruns, :dependent => :destroy, :dependent => :restrict_with_error
	has_many :foruns_comentarios, :dependent => :destroy, :dependent => :restrict_with_error
	has_many :conversas, :dependent => :destroy, :dependent => :restrict_with_error
	has_many :badges_alunos, :dependent => :destroy, :dependent => :restrict_with_error
	has_many :eventos, :dependent => :destroy, :dependent => :restrict_with_error
	has_many :artefatos_alunos, :dependent => :destroy, :dependent => :restrict_with_error
	has_many :comunicados, :dependent => :destroy, :dependent => :restrict_with_error
	has_many :dialogos, :dependent => :destroy, :dependent => :restrict_with_error

	validates_uniqueness_of :usuario_id, scope: :curso_id, message: "já está cadastrado no curso!"

	self.per_page = 10

	def evento
		@eventos = Evento.where('data >= ? and curso_id = ? and ativo = ?', Date.today, self.curso.id, true).order('data')
		if @eventos
			return @eventos
		end
	end

	def ranking
    	@usuarios = UsuarioCurso.where(curso_id: self.curso_id, perfil: 'Aluno').order(pontos_experiencia: :desc).limit(10)
  	end

end
