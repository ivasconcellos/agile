class CreateMensagens < ActiveRecord::Migration[5.2]
  def change
    create_table :mensagens do |t|
      t.string :texto
      t.references :chat_room, foreign_key: true
      t.references :usuario, foreign_key: true

      t.timestamps
    end
  end
end
