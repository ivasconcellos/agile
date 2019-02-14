class CreateGruposCursos < ActiveRecord::Migration[5.2]
  def change
    create_table :grupos_cursos do |t|
      t.references :grupo, foreign_key: true
      t.references :curso, foreign_key: true
      t.string :nome_curso

      t.timestamps
    end
  end
end
