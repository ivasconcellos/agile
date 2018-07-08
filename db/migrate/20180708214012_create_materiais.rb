class CreateMateriais < ActiveRecord::Migration[5.2]
  def change
    create_table :materiais do |t|
      t.string :nome
      t.text :descricao
      t.string :link
      t.references :conteudo, foreign_key: true

      t.timestamps
    end
  end
end
