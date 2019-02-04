class CreateNiveis < ActiveRecord::Migration[5.2]
  def change
    create_table :niveis do |t|
      t.string :nome
      t.integer :pontos_requeridos

      t.timestamps
    end
  end
end
