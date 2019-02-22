class CreateAvatares < ActiveRecord::Migration[5.2]
  def change
    create_table :avatares do |t|
      t.references :grupo, foreign_key: true
      t.string :nome
      t.string :perfil
      t.boolean :ativo, default: true
      t.timestamps
    end
  end
end
