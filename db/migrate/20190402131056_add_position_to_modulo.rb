class AddPositionToModulo < ActiveRecord::Migration[5.2]
  def change
    add_column :modulos, :position, :integer
  end
end
