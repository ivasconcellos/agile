class CreateMissoes < ActiveRecord::Migration[5.2]
  def change
    create_table :missoes do |t|
      t.references :modulo, foreign_key: true
      t.references :usuario_curso, foreign_key: true
      t.string :nome
      t.text :descricao
      t.boolean :ativo, default: true
      t.string :tipo
      t.float :pontuacao

      t.timestamps
    end
  end
end
