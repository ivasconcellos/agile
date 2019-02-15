class CreateEmails < ActiveRecord::Migration[5.2]
  def change
    create_table :emails do |t|
      t.references :usuario_curso, foreign_key: true
      t.text :mensagem
      t.references :destinatario_id, index: true, foreign_key: { to_table: :usuario_curso }

      t.timestamps
    end
  end
end
