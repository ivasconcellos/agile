class Tarefa < ApplicationRecord
  belongs_to :modulo
  belongs_to :usuario_curso
  has_many :tarefa_alunos, :dependent => :destroy, :dependent => :restrict_with_error

  self.per_page = 10

  validates_presence_of :nome, :descricao, :pontuacao, :data_inicio, :hora_inicio, :data_termino, :hora_termino
  validates_inclusion_of :pontuacao, :in => 0..100, message: " - A pontuação deve ser entre 1 e 100"

	def data_hora_inicio
		self.data_inicio.strftime("%d/%m/%Y") + " " + self.hora_inicio.strftime("%H:%M:%S")
	end

	def data_hora_termino
		self.data_termino.strftime("%d/%m/%Y") + " " + self.hora_termino.strftime("%H:%M:%S")
	end

end
