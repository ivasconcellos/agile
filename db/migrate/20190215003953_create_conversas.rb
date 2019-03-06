class CreateConversas < ActiveRecord::Migration[5.2]
  def change
    create_table :conversas do |t|
      t.references :usuario_curso, foreign_key: true
      t.string :assunto
      t.text :mensagem
      t.references :destinatario, index: true, foreign_key: { to_table: :usuario_curso }
      t.boolean :lida, default: false
      t.references :conversa, foreign_key: true
      t.timestamps
    end
  end
end
