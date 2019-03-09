class CreateTarefas < ActiveRecord::Migration[5.2]
  def change
    create_table :tarefas do |t|
      t.references :missao, foreign_key: true
      t.references :usuario_curso, foreign_key: true
      t.text :nome
      t.text :descricao

      t.timestamps
    end
  end
end
