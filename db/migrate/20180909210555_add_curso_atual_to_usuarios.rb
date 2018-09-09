class AddCursoAtualToUsuarios < ActiveRecord::Migration[5.2]
  def change
    add_reference :usuarios, :curso_atual, index: true, foreign_key: { to_table: :cursos }
  end
end
