class AddModuloToForuns < ActiveRecord::Migration[5.2]
  def change
    add_reference :foruns, :modulo, foreign_key: true
  end
end
