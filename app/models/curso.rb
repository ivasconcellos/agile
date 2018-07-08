class Curso < ApplicationRecord
	validates_presence_of :nome, :tema_curso_id
	belongs_to :tema_curso
  	self.per_page = 10
end
