class CreateTarefas < ActiveRecord::Migration[5.2]
  def change
    create_table :tarefas do |t|
      t.references :missao, foreign_key: true
      t.references :usuario_curso, foreign_key: true
      t.text :nome
      t.text :descricao
      t.date :data_inicio
      t.time :hora_inicio
      t.date :data_termino
      t.time :hora_termino
      t.boolean :publico, default: true

      t.timestamps
    end
  end
end
