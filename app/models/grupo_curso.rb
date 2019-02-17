class GrupoCurso < ApplicationRecord
  belongs_to :grupo
  belongs_to :curso
  has_many :usuarios_cursos

  validates_presence_of :nome_curso
  
  self.per_page = 10
end
