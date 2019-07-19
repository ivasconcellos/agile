class CreatePontuacaoRemovidas < ActiveRecord::Migration[5.2]
  def change
    create_table :pontuacao_removidas do |t|
      t.integer :pontuacao
      t.text :justificativa
      t.references :aluno
      t.references :professor

      t.timestamps
    end
  end
end
