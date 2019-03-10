class CreateMissoes < ActiveRecord::Migration[5.2]
  def change
    create_table :missoes do |t|
      t.references :modulo, foreign_key: true
      t.references :usuario_curso, foreign_key: true
      t.string :nome
      t.text :descricao
      t.boolean :publico, default: true
      t.string :tipo
      t.float :pontuacao
      t.date :data_inicio
      t.time :hora_inicio
      t.date :data_termino
      t.time :hora_termino

      t.timestamps
    end
  end
end
