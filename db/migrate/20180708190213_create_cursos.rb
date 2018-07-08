class CreateCursos < ActiveRecord::Migration[5.2]
  def change
    create_table :cursos do |t|
      t.string :nome, null: false
      t.text :descricao
      t.date :data_inicio
      t.date :data_termino
      t.boolean :ativo, default: true
      t.references :tema_curso, foreign_key: true

      t.timestamps
    end
  end
end
