class GrupoCurso < ApplicationRecord
  belongs_to :grupo
  belongs_to :curso
  has_many :usuario_curso, :dependent => :destroy, :dependent => :restrict_with_error

  validates_presence_of :nome_curso
  
  self.per_page = 10

  def pontuacao_total
  	UsuarioCurso.where(grupo_curso_id: self.id, curso_id: self.curso.id).sum('pontos_experiencia')
  end

  def pontuacao_media
  	UsuarioCurso.where(grupo_curso_id: self.id, curso_id: self.curso.id).average('pontos_experiencia')
  end
end
