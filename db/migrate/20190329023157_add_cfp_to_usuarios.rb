class AddCfpToUsuarios < ActiveRecord::Migration[5.2]
  def change
    add_column :usuarios, :cpf, :string
  end
end
