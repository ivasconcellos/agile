class CreateDicas < ActiveRecord::Migration[5.2]
  def change
    create_table :dicas do |t|
      t.string :nome
      t.string :descricao
      t.boolean :ativo
      t.references :missao, foreign_key: true

      t.timestamps
    end
  end
end
