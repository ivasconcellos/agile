class CreateForuns < ActiveRecord::Migration[5.2]
  def change
    create_table :foruns do |t|
      t.string :titulo
      t.text :descricao
      t.references :curso, foreign_key: true
      t.references :usuario_curso, foreign_key: true

      t.timestamps
    end
  end
end
