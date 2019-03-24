class CreateQuizPerguntas < ActiveRecord::Migration[5.2]
  def change
    create_table :quiz_perguntas do |t|
      t.references :quiz, foreign_key: true
      t.text :descricao
      t.float :pontuacao

      t.timestamps
    end
  end
end
