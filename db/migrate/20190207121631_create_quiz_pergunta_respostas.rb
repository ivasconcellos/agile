class CreateQuizPerguntaRespostas < ActiveRecord::Migration[5.2]
  def change
    create_table :quiz_pergunta_respostas do |t|
      t.references :quiz_pergunta, foreign_key: true
      t.text :descricao
      t.text :comentario
      t.boolean :correta, default: false

      t.timestamps
    end
  end
end
