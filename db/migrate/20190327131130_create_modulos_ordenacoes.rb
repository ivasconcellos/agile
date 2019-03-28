class CreateModulosOrdenacoes < ActiveRecord::Migration[5.2]
  def change
    create_table :modulos_ordenacoes do |t|
      t.references :modulo
      t.integer :sort
      t.string :classe
      t.integer :classe_id

      t.timestamps
    end
  end
end
