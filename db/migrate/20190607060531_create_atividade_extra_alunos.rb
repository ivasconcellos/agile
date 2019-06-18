class CreateAtividadeExtraAlunos < ActiveRecord::Migration[5.2]
  def change
    create_table :atividade_extra_alunos do |t|
      t.integer :pontuacao
      t.references :aluno
      t.references :professor
      t.references :atividade_extra, foreign_key: true

      t.timestamps
    end
  end
end
