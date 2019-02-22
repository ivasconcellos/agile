class CreateArtefatosAlunos < ActiveRecord::Migration[5.2]
  def change
    create_table :artefatos_alunos do |t|
      t.references :usuario_curso, foreign_key: true
      t.references :artefatos, foreign_key: true

      t.timestamps
    end
  end
end
