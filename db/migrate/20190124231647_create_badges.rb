class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :nome
      t.boolean :ativo, default: true

      t.timestamps
    end
  end
end
