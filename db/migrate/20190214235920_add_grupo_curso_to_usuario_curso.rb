class AddGrupoCursoToUsuarioCurso < ActiveRecord::Migration[5.2]
  def change
    add_reference :usuario_curso, :grupo_curso, foreign_key: true
  end
end
