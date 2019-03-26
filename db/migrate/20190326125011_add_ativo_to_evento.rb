class AddAtivoToEvento < ActiveRecord::Migration[5.2]
  def change
    add_column :eventos, :ativo, :boolean, default: true
  end
end
