class CreateTemasCursos < ActiveRecord::Migration[5.2]
  def change
    create_table :temas_cursos do |t|
      t.string :nome, null: false
      t.boolean :ativo, defaut: true
      t.string :cor_titulo, null: false
      t.string :cor_texto, null: false
      t.string :cor_fundo, null: false
      t.timestamps
    end
  end
end
