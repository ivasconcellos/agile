class CreateAtividades < ActiveRecord::Migration[5.2]
  def change
    create_table :atividades do |t|
      t.integer :pontuacao
      t.text :descricao
      t.references :usuario_curso, foreign_key: true
      t.references :modulo, foreign_key: true

      t.timestamps
    end
  end
end
