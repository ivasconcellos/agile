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
	has_many :comunicados, :foreign_key => "remetente_id", :dependent => :destroy, :dependent => :restrict_with_error
	has_many :dialogos, :dependent => :destroy, :dependent => :restrict_with_error
	has_many :recompensas, :dependent => :destroy
	
	validates_uniqueness_of :usuario_id, scope: :curso_id, message: "já está cadastrado no curso!"

	self.per_page = 10

	def evento
		@eventos = Evento.where('data >= ? and curso_id = ? and ativo = ?', Date.today, self.curso.id, true).order('data')
		if @eventos
			return @eventos
		end
	end

	def ranking
    	@usuarios = UsuarioCurso.where(curso_id: self.curso_id, perfil: 'Aluno').order(pontos_experiencia: :desc, created_at: :asc).limit(10)
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
				@foruns = Forum.exists?(ativo: true, modulo_id: self.curso.modulo_ids)
		end

  	def chat
  		@chats = SalaChat.exists?(ativo: true, curso_id: self.curso_id)
  	end

  	def pesquisa
  		@pesquisas = !AnswerGroup.exists?(usuario_curso_id: self.id, question_group_id: QuestionGroup.where(curso_id: self.curso_id))
		end
		
		def notificacao
			@notificacoes = Notificacao.exists?(usuario_curso_id: self.id)
		end

  	def pode_finalizar_curso
  		@pesquisas = AnswerGroup.exists?(usuario_curso_id: self.id, question_group_id: QuestionGroup.where(curso_id: self.curso_id))
  		@tarefas_curso = Tarefa.joins(missao: :modulo).where('modulos.curso_id = ?', self.curso_id)
  		if !@tarefas_curso.empty?
  			@tarefas = TarefaAluno.exists?(usuario_curso_id: self.id, tarefa_id: Tarefa.joins(missao: :modulo).where('modulos.curso_id = ? and tarefa_alunos.avaliada = ?', self.curso_id, true))
  		else
  			@tarefas = true
  		end
		@quizzes = QuizRespostaAluno.exists?(usuario_curso_id: self.id, quiz_pergunta_resposta_id: QuizPerguntaResposta.joins(quiz_pergunta: { quiz: {missao: :modulo }}).where('modulos.curso_id = ?', self.curso_id))  		
		@status =  self.status_curso != 'Inscricao Cancelada'
		if @pesquisas and @tarefas and @quizzes and @status
			return true
		else
			return false
		end
	  end
	  
	def pode_responder_pesquisa_final
		@tarefas_curso = Tarefa.joins(missao: :modulo).where('modulos.curso_id = ?', self.curso_id)
		if !@tarefas_curso.empty?
			@tarefas = TarefaAluno.exists?(usuario_curso_id: self.id, tarefa_id: @tarefas_curso)
		else
			@tarefas = true
		end
		@quizzes = Quiz.joins(missao: :modulo).where('modulos.curso_id =?', self.curso_id).where.not(id: QuizRespostaAluno.joins(quiz: [missao: :modulo]).select('quiz_respostas_alunos.quiz_id').where('modulos.curso_id = ? and quiz_respostas_alunos.usuario_curso_id =?', self.curso_id, self.id)).group('quizzes.id')
		if @tarefas and @quizzes.empty?
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

  	def porcentagem_aprovacao
  		@notas_tarefas = TarefaAvaliacao.joins(tarefa_aluno: [tarefa: :missao]).where('missoes.tipo = ? and tarefa_alunos.usuario_curso_id = ?', 'Tarefa', self.id).sum('nota')
  		@missoes_tarefa_pontuacao = TarefaAvaliacao.joins(tarefa_aluno: [tarefa: :missao]).where('missoes.tipo = ? and tarefa_alunos.usuario_curso_id = ?', 'Tarefa', self.id).sum('missoes.pontuacao')
  		@notas_quizzes = QuizRespostaAluno.joins(quiz_pergunta_resposta: :quiz_pergunta).where(
			'quiz_respostas_alunos.usuario_curso_id =? and 
			quiz_pergunta_respostas.correta = ?', 
			self.id, true).sum('quiz_perguntas.pontuacao')
  		@missoes_quiz_pontuacao =  QuizRespostaAluno.joins(quiz_pergunta_resposta: :quiz_pergunta).where(
			'quiz_respostas_alunos.usuario_curso_id =?', 
			self.id).sum('quiz_perguntas.pontuacao')

  		@soma_missoes = @missoes_tarefa_pontuacao + @missoes_quiz_pontuacao
  		if @soma_missoes.nonzero?
  			return (@notas_tarefas + @notas_quizzes) / (@soma_missoes) * 100
  		else
  			return 100
  		end
  	end

end
