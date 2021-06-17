class AddVisualizadaToNotificacoes < ActiveRecord::Migration[5.2]
  def change
    add_column :notificacoes, :visualizada, :boolean, default: false
  end
end
