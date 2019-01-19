class AddDataLimiteAndHoraLimiteToTarefas < ActiveRecord::Migration[5.2]
  def change
    add_column :tarefas, :data_limite, :date
    add_column :tarefas, :hora_limite, :time
  end
end
