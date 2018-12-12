class CreateTarefas < ActiveRecord::Migration[5.2]
  def change
    create_table :tarefas do |t|
      t.references :conteudo, foreign_key: true
      t.references :usuario, foreign_key: true
      t.text :texto
      t.float :pontuacao

      t.timestamps
    end
  end
end
