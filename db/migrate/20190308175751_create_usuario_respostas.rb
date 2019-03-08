class CreateUsuarioRespostas < ActiveRecord::Migration[5.2]
  def change
    create_table :usuario_respostas do |t|
      t.references :usuario_curso, foreign_key: true
      t.references :respostas_perguntas, foreign_key: true

      t.timestamps
    end
  end
end
