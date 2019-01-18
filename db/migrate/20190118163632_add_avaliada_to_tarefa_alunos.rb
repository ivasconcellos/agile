class AddAvaliadaToTarefaAlunos < ActiveRecord::Migration[5.2]
  def change
    add_column :tarefa_alunos, :avaliada, :boolean, default: false
  end
end
