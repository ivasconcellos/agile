class CreateUsuarioCurso < ActiveRecord::Migration[5.2]
  def change
    create_table :usuario_curso do |t|
      t.string :pefil, null: false, default: 'Aluno'
      t.string :nickname,  null: false
      t.references :usuario, foreign_key: true
      t.references :curso, foreign_key: true

      t.timestamps
    end
  end
end
