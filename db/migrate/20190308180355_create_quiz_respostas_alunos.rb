class CreateQuizRespostasAlunos < ActiveRecord::Migration[5.2]
  def change
    create_table :quiz_respostas_alunos do |t|
      t.references :usuario_curso, foreign_key: true
      t.references :quiz_pergunta_resposta, foreign_key: true

      t.timestamps
    end
  end
end
