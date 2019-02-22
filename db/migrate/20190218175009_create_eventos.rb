class CreateEventos < ActiveRecord::Migration[5.2]
  def change
    create_table :eventos do |t|
      t.date :data
      t.string :descricao
      t.string :alerta_eventos
      t.references :usuario_curso, foreign_key: true

      t.timestamps
    end
  end
end
