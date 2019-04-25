class AddLoginTokenToUsuarios < ActiveRecord::Migration[5.2]
  def change
    add_column :usuarios, :login_token, :string
  end
end
