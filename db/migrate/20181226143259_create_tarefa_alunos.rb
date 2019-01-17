class CreateTarefaAlunos < ActiveRecord::Migration[5.2]
  def change
    create_table :tarefa_alunos do |t|
      t.references :tarefa, foreign_key: true
      t.references :usuario_curso, foreign_key: true

      t.timestamps
    end
  end
end
