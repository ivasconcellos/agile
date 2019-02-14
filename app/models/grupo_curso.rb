class GrupoCurso < ApplicationRecord
  belongs_to :grupo
  belongs_to :curso

  validates_presence_of :nome_curso
  self.per_page = 10
end
