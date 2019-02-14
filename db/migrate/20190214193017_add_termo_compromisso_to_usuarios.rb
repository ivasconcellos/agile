class AddTermoCompromissoToUsuarios < ActiveRecord::Migration[5.2]
  def change
    add_column :usuarios, :termo_compromisso, :boolean, default: false
  end
end
