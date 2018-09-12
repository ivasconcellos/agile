class AddPublicoToMateriais < ActiveRecord::Migration[5.2]
  def change
    add_column :materiais, :publico, :boolean, default: true
  end
end
