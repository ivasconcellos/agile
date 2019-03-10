class CreatePerguntasQuiz < ActiveRecord::Migration[5.2]
  def change
    create_table :perguntas_quiz do |t|
      t.references :quiz, foreign_key: true
      t.text :descricao
      t.float :pontuacao

      t.timestamps
    end
  end
end
