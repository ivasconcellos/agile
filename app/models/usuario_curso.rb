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

  	def ranking_equipe
  		equipes = {}
  		@grupos = GrupoCurso.joins(:grupo).where('curso_id = ? and grupos.perfil = ?', self.curso.id, 'Aluno')
  		for grupo in @grupos
  			equipes[grupo.nome_curso] = UsuarioCurso.where(grupo_curso_id: grupo.id, curso_id: self.curso.id).average('pontos_experiencia').to_f
  		end  	

  		return Hash[equipes.sort_by{|k, v| v}.reverse]
  	end

  	def forum
  		@foruns = Forum.exists?(ativo: true, curso_id: self.curso_id)
  	end

  	def chat
  		@chats = SalaChat.exists?(ativo: true, curso_id: self.curso_id)
  	end

  	def pesquisa
  		@pesquisas = !AnswerGroup.exists?(usuario_curso_id: self.id, question_group_id: QuestionGroup.where(curso_id: self.curso_id))
  	end

  	def pode_finalizar_curso
  		@pesquisas = AnswerGroup.exists?(usuario_curso_id: self.id, question_group_id: QuestionGroup.where(curso_id: self.curso_id))
  		@tarefas = TarefaAluno.exists?(usuario_curso_id: self.id, tarefa_id: Tarefa.joins(missao: :modulo).where('modulos.curso_id = ? and tarefa_alunos.avaliada = ?', self.curso_id, true))
		@quizzes = QuizRespostaAluno.exists?(usuario_curso_id: self.id, quiz_pergunta_resposta_id: QuizPerguntaResposta.joins(quiz_pergunta: { quiz: {missao: :modulo }}).where('modulos.curso_id = ?', self.curso_id))  		
		@status =  self.status_curso != 'Inscricao Cancelada'
		if @pesquisas and @tarefas and @quizzes and @status
			return true
		else
			return false
		end
	  end
	  
	def pode_responder_pesquisa_final
		@tarefas = TarefaAluno.exists?(usuario_curso_id: self.id, tarefa_id: Tarefa.joins(missao: :modulo).where('modulos.curso_id = ?', self.curso_id))
		@quizzes = QuizRespostaAluno.exists?(usuario_curso_id: self.id, quiz_id: Quiz.joins(missao: :modulo ).where('modulos.curso_id = ?', self.curso_id))  		
		if @tarefas and @quizzes 
			return true
		else
			return false
		end
	end

  	def verifica_aprovacao
  		@pontuacao_missao = Missao.joins(:modulo).where('modulos.curso_id =?', self.curso_id).sum('pontuacao')
  		if self.pontos_experiencia / @pontuacao_missao >= self.curso.porcentagem_aprovacao / 100.0
  			return true
  		else
  			return false
  		end
  	end	


end
