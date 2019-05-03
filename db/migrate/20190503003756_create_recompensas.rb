class CreateRecompensas < ActiveRecord::Migration[5.2]
  def change
    create_table :recompensas do |t|
      t.integer :posicao_ranking
      t.string :nome
      t.text :descricao
      t.references :usuario_curso, foreign_key: true
      t.references :curso, foreign_key: true

      t.timestamps
    end
  end
end
