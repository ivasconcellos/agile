class CreateMateriais < ActiveRecord::Migration[5.2]
  def change
    create_table :materiais do |t|
      t.string :nome, null: false
      t.text :descricao, null: false
      t.string :link, null: false
      t.references :conteudo, foreign_key: true

      t.timestamps
    end
  end
end
