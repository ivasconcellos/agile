class CreateTemaCursos < ActiveRecord::Migration[5.2]
  def change
    create_table :tema_cursos do |t|
      t.string :nome, null: false
      t.boolean :ativo, default: true
      t.string :cor_titulo, null: false
      t.string :cor_texto, null: false
      t.string :cor_fundo, null: false
      t.timestamps
    end
  end
end
