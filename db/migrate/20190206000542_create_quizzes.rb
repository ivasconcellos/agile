class CreateQuizzes < ActiveRecord::Migration[5.2]
  def change
    create_table :quizzes do |t|
      t.references :missao, foreign_key: true
      t.string :nome
      t.text :descricao
      t.boolean :finalizado, default: false
      t.references :usuario_curso, foreign_key: true

      t.timestamps
    end
  end
end
