class CreateBadgesAlunos < ActiveRecord::Migration[5.2]
  def change
    create_table :badges_alunos do |t|
      t.references :usuario_curso, foreign_key: true
      t.references :badges, foreign_key: true

      t.timestamps
    end
  end
end
