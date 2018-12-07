class CreateComentarios < ActiveRecord::Migration[5.2]
  def change
    create_table :comentarios do |t|
      t.references :usuario, foreign_key: true
      t.references :forum, foreign_key: true
      t.text :texto
      t.references :comentario, foreign_key: true

      t.timestamps
    end
  end
end
