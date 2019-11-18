class Curso < ApplicationRecord
	belongs_to :tema_curso
	belongs_to :proprietario, class_name: "Usuario"
	has_many :usuario_curso, :dependent => :destroy, :dependent => :restrict_with_error
	has_many :foruns, :dependent => :destroy, :dependent => :restrict_with_error
	has_many :modulos, :dependent => :destroy, :dependent => :restrict_with_error
	has_many :salas_chat, :dependent => :destroy, :dependent => :restrict_with_error
	has_many :eventos, :dependent => :destroy, :dependent => :restrict_with_error
	has_many :comunicados, :dependent => :destroy, :dependent => :restrict_with_error
	has_many :grupos_cursos, :dependent => :destroy, :dependent => :restrict_with_error
	has_many :recompensas, :dependent => :destroy
	
	validates_presence_of :nome, :descricao, :proprietario_id, :codigo_acesso, :data_inicio, :hora_inicio, :data_termino, :hora_termino, :carga_horaria, :porcentagem_aprovacao, :publico_alvo
	validates_length_of :codigo_acesso, :minimum => 8, :maximum => 8
	validates_uniqueness_of :codigo_acesso
	
  	self.per_page = 10

  	def data_hora_inicio
  		self.data_inicio.strftime("%d/%m/%Y") + " - " + self.hora_inicio.strftime("%H:%M:%S")
  	end

  	def data_hora_termino
  		self.data_termino.strftime("%d/%m/%Y") + " - " + self.hora_termino.strftime("%H:%M:%S")
  	end

  	def alerta

		@alertas = []

		@quiz_nao_finalizado = Quiz.joins(missao: :modulo).where('modulos.curso_id = ? and finalizado =?', self.id, false).first
	  	@missao_quiz = Missao.joins(:modulo).where('modulos.curso_id = ? and missoes.tipo = ?', self.id, 'Quiz').select { |missao| !missao.quiz }.first
	  	@missao_tarefa = Missao.joins(:modulo).where('modulos.curso_id = ? and tipo =?', self.id, 'Tarefa').select { |missao| !missao.tarefa }.first
	  	@tarefa_pendente_avaliacao = TarefaAluno.joins(:usuario_curso).where('usuario_curso.curso_id = ? and avaliada =?', self.id, false).first
	  	@grupos_curso_professor = !GrupoCurso.joins(:grupo).where('grupos.perfil = ?', 'Professor').exists?(curso_id: self.id)
	  	@grupos_curso_aluno = !GrupoCurso.joins(:grupo).where('grupos.perfil = ?', 'Aluno').exists?(curso_id: self.id)

	  	if @quiz_nao_finalizado
	  		@alertas.append("Há Quiz não finalizado!")
	  	end
	  	  
	  	if @missao_quiz
	  	  	@alertas.append("Há Missão Cadastrada sem Quiz!")
	    end
	      
	    if @missao_tarefa
	      	@alertas.append("Há Missão Cadastrada sem Tarefa!")
	    end
	      
	    if @tarefa_pendente_avaliacao
	    	@alertas.append("Há Tarefas a serem avaliadas!")
	    end

	    if @grupos_curso_professor
	    	@alertas.append("Não há Equipes cadastradas para os professores deste curso! Por favor, cadastre no menu Equipes.")
	    end

	    if @grupos_curso_aluno
	    	@alertas.append("Não há Equipes cadastradas para os alunos deste curso! Por favor, cadastre no menu Equipes.")
	    end
	    return @alertas
		
	end

end
