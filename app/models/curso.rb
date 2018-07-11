class Curso < ApplicationRecord
	belongs_to :tema_curso
	belongs_to :proprietario, class_name: "Usuario"
	validates_presence_of :nome, :tema_curso_id, :proprietario_id, :codigo_acesso
	validates_length_of :codigo_acesso, :minimum => 8, :maximum => 8
  	self.per_page = 10
end
