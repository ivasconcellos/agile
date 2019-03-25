class Forum < ApplicationRecord
  belongs_to :curso
  has_many :foruns_comentarios, :dependent => :destroy, :dependent => :restrict_with_error
  belongs_to :usuario_curso

  validates_presence_of :titulo, :descricao, :curso_id
  
  self.per_page = 10
end
