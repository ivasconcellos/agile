class CreateTarefaAvaliacao < ActiveRecord::Migration[5.2]
  def change
    create_table :tarefa_avaliacao do |t|
      t.references :tarefa_aluno, foreign_key: true
      t.float :nota
      t.text :comentario
      t.references :usuario_curso, foreign_key: true

      t.timestamps
    end
  end
end
