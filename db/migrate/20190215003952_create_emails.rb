class CreateEmails < ActiveRecord::Migration[5.2]
  def change
    create_table :emails do |t|
      t.references :usuario_curso, foreign_key: true
      t.string :assunto
      t.text :mensagem
      t.references :destinatario, index: true, foreign_key: { to_table: :usuario_curso }

      t.timestamps
    end
  end
end
