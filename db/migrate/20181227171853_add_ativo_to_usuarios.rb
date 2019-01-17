class AddAtivoToUsuarios < ActiveRecord::Migration[5.2]
  def change
    add_column :usuarios, :ativo, :boolean, default: true
  end
end
