class Curso < ApplicationRecord
	validates_presence_of :nome, :tema_curso_id, :proprietario_id
	belongs_to :tema_curso
	belongs_to :proprietario, class_name: "Usuario"
  	self.per_page = 10
end
