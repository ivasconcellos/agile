class CreateAtividadeExtras < ActiveRecord::Migration[5.2]
  def change
    create_table :atividade_extras do |t|
      t.integer :pontuacao
      t.text :descricao
      t.references :usuario_curso, foreign_key: true
      t.references :modulo, foreign_key: true

      t.timestamps
    end
  end
end
