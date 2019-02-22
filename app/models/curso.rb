class Curso < ApplicationRecord
	belongs_to :tema_curso
	belongs_to :proprietario, class_name: "Usuario"
	has_many :usuario_curso, :dependent => :destroy, :dependent => :restrict_with_error
	has_many :foruns, :dependent => :destroy, :dependent => :restrict_with_error
	has_many :modulos, :dependent => :destroy, :dependent => :restrict_with_error
	has_many :salas_chat, :dependent => :destroy, :dependent => :restrict_with_error
	has_many :missoes, :dependent => :destroy, :dependent => :restrict_with_error

	validates_presence_of :nome, :tema_curso_id, :proprietario_id, :codigo_acesso, :data_inicio, :hora_inicio, :data_termino, :hora_termino
	validates_length_of :codigo_acesso, :minimum => 8, :maximum => 8
	validates_uniqueness_of :codigo_acesso
	
  	self.per_page = 10

  	def data_hora_inicio
  		self.data_inicio.strftime("%d/%m/%Y") + " " + self.hora_inicio.strftime("%H:%M:%S")
  	end

  	def data_hora_termino
  		self.data_termino.strftime("%d/%m/%Y") + " " + self.hora_termino.strftime("%H:%M:%S")
  	end
end
