class CreateForunsComentarios < ActiveRecord::Migration[5.2]
  def change
    create_table :foruns_comentarios do |t|
      t.references :usuario_curso, foreign_key: true
      t.references :forum, foreign_key: true
      t.text :texto
      t.references :forum_comentario, foreign_key: true

      t.timestamps
    end
  end
end
