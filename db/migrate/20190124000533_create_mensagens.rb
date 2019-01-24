class CreateMensagens < ActiveRecord::Migration[5.2]
  def change
    create_table :mensagens do |t|
      t.string :texto
      t.references :sala_chat, foreign_key: true
      t.references :usuario_curso, foreign_key: true

      t.timestamps
    end
  end
end
