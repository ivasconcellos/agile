class AddAtivoToAvatares < ActiveRecord::Migration[5.2]
  def change
    add_column :avatares, :ativo, :boolean, default: true
  end
end
