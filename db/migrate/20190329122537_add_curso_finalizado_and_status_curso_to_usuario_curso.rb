class AddCursoFinalizadoAndStatusCursoToUsuarioCurso < ActiveRecord::Migration[5.2]
  def change
    add_column :usuario_curso, :curso_finalizado, :boolean, default: false
    add_column :usuario_curso, :status_curso, :string, default: 'Em andamento'
  end
end
