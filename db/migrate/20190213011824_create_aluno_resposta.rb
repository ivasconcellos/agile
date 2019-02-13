class CreateAlunoResposta < ActiveRecord::Migration[5.2]
  def change
    create_table :aluno_resposta do |t|
      t.references :usuario_curso, foreign_key: true
      t.references :respostas_perguntas, foreign_key: true
      t.boolean :correta, default: false

      t.timestamps
    end
  end
end
