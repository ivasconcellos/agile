class CreateUsuarioCurso < ActiveRecord::Migration[5.2]
  def change
    create_table :usuario_curso do |t|
      t.string :perfil, null: false, default: 'Aluno'
      t.string :nickname,  null: false
      t.float :pontos_experiencia, default: 0
      t.references :usuario, foreign_key: true
      t.references :curso, foreign_key: true

      t.timestamps
    end
  end
end
