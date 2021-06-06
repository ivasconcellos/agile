class AddAreaToCursos < ActiveRecord::Migration[5.2]
  def change
    add_reference :cursos, :area, foreign_key: true
  end
end
