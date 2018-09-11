class AddPublicoToCursos < ActiveRecord::Migration[5.2]
  def change
    add_column :cursos, :publico, :boolean, default: false
  end
end
