class CreateModulos < ActiveRecord::Migration[5.2]
  def change
    create_table :modulos do |t|
      t.string :nome
      t.text :descricao
      t.references :curso, foreign_key: true

      t.timestamps
    end
  end
end
