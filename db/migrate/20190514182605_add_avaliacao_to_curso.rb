class AddAvaliacaoToCurso < ActiveRecord::Migration[5.2]
  def change
    add_column :cursos, :avaliacao, :integer
  end
end
