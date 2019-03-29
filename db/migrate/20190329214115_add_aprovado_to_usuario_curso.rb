class AddAprovadoToUsuarioCurso < ActiveRecord::Migration[5.2]
  def change
    add_column :usuario_curso, :aprovado, :boolean
  end
end
