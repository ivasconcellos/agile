class AddQuizToQuizRespostasAlunos < ActiveRecord::Migration[5.2]
  def change
    add_reference :quiz_respostas_alunos, :quiz, foreign_key: true
  end
end
