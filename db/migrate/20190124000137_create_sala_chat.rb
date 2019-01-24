class CreateSalaChat < ActiveRecord::Migration[5.2]
  def change
    create_table :sala_chat do |t|
      t.string :nome
      t.references :usuario, foreign_key: true

      t.timestamps
    end
  end
end
