class AddNivelToUsuarioCurso < ActiveRecord::Migration[5.2]
  def change
    add_reference :usuario_curso, :nivel, foreign_key: true
  end
end
