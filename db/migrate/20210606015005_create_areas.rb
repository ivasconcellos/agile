class CreateAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :areas do |t|
      t.string :nome
      t.boolean :ativa, default: true

      t.timestamps
    end
  end
end
