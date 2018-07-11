class CreateExplicacoes < ActiveRecord::Migration[5.2]
  def change
    create_table :explicacoes do |t|
      t.string :nome, null: false
      t.text :descricao
      t.string :audio
      t.references :conteudo, foreign_key: true

      t.timestamps
    end
  end
end