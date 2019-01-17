class CreateTarefas < ActiveRecord::Migration[5.2]
  def change
    create_table :tarefas do |t|
      t.references :modulo, foreign_key: true
      t.references :usuario_curso, foreign_key: true
      t.text :nome
      t.text :descricao
      t.float :pontuacao
      t.boolean :publico, default: true

      t.timestamps
    end
  end
end
