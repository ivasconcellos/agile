class AddTipoToMateriais < ActiveRecord::Migration[5.2]
  def change
    add_column :materiais, :tipo, :string
  end
end
