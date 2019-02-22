class CreateMateriais < ActiveRecord::Migration[5.2]
  def change
    create_table :materiais do |t|
      t.string :nome, null: false
      t.text :texto      
      t.string :tipo
      t.boolean :publico, default: true
      t.references :modulo, foreign_key: true

      t.timestamps
    end
  end
end
