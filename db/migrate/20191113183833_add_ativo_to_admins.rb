class AddAtivoToAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :ativo, :boolean, default: true
  end
end
