class CreateConteudos < ActiveRecord::Migration[5.2]
  def change
    create_table :conteudos do |t|
      t.string :nome, null: false
      t.text :descricao
      t.references :curso, foreign_key: true

      t.timestamps
    end
  end
end
