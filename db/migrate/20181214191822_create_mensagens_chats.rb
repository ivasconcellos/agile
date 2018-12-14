class CreateMensagensChats < ActiveRecord::Migration[5.2]
  def change
    create_table :mensagens_chats do |t|
      t.text :texto
      t.references :usuario_curso, foreign_key: true
      t.references :sala_chat, foreign_key: true

      t.timestamps
    end
  end
end
