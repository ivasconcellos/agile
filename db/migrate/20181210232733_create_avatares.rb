class CreateAvatares < ActiveRecord::Migration[5.2]
  def change
    create_table :avatares do |t|
      t.references :tema_curso, foreign_key: true
      t.string :nome
      t.string :perfil

      t.timestamps
    end
  end
end
