class CreateDialogos < ActiveRecord::Migration[5.2]
  def change
    create_table :dialogos do |t|
      t.string :titulo
      t.text :texto
      t.references :usuario_curso, foreign_key: true
      t.references :modulo, foreign_key: true

      t.timestamps
    end
  end
end
