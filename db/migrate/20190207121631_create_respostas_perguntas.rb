class CreateRespostasPerguntas < ActiveRecord::Migration[5.2]
  def change
    create_table :respostas_perguntas do |t|
      t.references :pergunta_quiz, foreign_key: true
      t.text :descricao
      t.text :comentario
      t.boolean :correta, default: false

      t.timestamps
    end
  end
end
