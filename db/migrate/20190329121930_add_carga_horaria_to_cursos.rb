class AddCargaHorariaToCursos < ActiveRecord::Migration[5.2]
  def change
    add_column :cursos, :carga_horaria, :integer
  end
end
