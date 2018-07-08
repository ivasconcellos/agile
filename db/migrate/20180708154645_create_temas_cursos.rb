class CreateTemasCursos < ActiveRecord::Migration[5.2]
  def change
    create_table :temas_cursos do |t|
      t.string :nome
      t.boolean :ativo
      t.string :cor_titulo
      t.string :cor_texto

      t.timestamps
    end
  end
end
