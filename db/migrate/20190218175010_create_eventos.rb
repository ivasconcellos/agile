class CreateEventos < ActiveRecord::Migration[5.2]
  def change
    create_table :eventos do |t|
      t.date :data
      t.time :hora
      t.string :nome
      t.text :descricao
      t.boolean :ativo, default: true
      t.references :usuario_curso, foreign_key: true
      t.references :curso, foreign_key: true
      t.timestamps
    end
  end
end
