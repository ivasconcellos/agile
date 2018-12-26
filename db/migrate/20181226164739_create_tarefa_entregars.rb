class CreateTarefaEntregars < ActiveRecord::Migration[5.2]
  def change
    create_table :tarefa_entregars do |t|
      t.references :tarefa, foreign_key: true
      t.references :usuario_curso, foreign_key: true
      t.text :comentario

      t.timestamps
    end
  end
end
