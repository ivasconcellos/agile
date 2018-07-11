class AddProprietarioToCursos < ActiveRecord::Migration[5.2]
  def change
    add_reference :cursos, :proprietario, index: true, foreign_key: { to_table: :usuarios }
  end
end
