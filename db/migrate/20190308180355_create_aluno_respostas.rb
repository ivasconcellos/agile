class CreateAlunoRespostas < ActiveRecord::Migration[5.2]
  def change
    create_table :aluno_respostas do |t|
      t.references :usuario_curso, foreign_key: true
      t.references :resposta_pergunta, foreign_key: true

      t.timestamps
    end
  end
end
