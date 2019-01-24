class Curso < ApplicationRecord
	belongs_to :tema_curso
	belongs_to :proprietario, class_name: "Usuario"
	has_many :usuario_curso
	has_many :foruns
	has_many :modulos
	has_many :salas_chat

	validates_presence_of :nome, :tema_curso_id, :proprietario_id, :codigo_acesso
	validates_length_of :codigo_acesso, :minimum => 8, :maximum => 8
	validates_uniqueness_of :codigo_acesso
	
  	self.per_page = 10
end
