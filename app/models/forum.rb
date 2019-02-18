class Forum < ApplicationRecord
  belongs_to :curso
  has_many :comentarios
  belongs_to :usuario_curso

  validates_presence_of :titulo, :descricao, :curso_id
  
  self.per_page = 10
end
