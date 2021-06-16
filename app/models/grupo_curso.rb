class GrupoCurso < ApplicationRecord
  belongs_to :grupo
  belongs_to :curso
  has_many :usuario_curso, :dependent => :destroy, :dependent => :restrict_with_error

  validates_presence_of :nome_curso
  
  self.per_page = 10

  def pontuacao_total_equipe
    pontuacao_total = 0
  	alunos = UsuarioCurso.where(grupo_curso_id: self.id, curso_id: self.curso.id)
    for aluno in alunos
      pontuacao_total = pontuacao_total + aluno.pontuacao
    end
    return pontuacao_total
  end

  def pontuacao_media_equipe
    qnt_alunos_grupo = UsuarioCurso.where(grupo_curso_id: self.id, curso_id: self.curso.id).count
  	media = self.pontuacao_total_equipe / qnt_alunos_grupo
    return "%g" % ("%.2f" % media)
  end
end
