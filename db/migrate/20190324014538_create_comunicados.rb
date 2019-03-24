class CreateComunicados < ActiveRecord::Migration[5.2]
  def change
    create_table :comunicados do |t|
      t.string :assunto
      t.text :mensagem
      t.references :curso, foreign_key: true
      t.references :remetente, index: true, foreign_key: { to_table: :usuario_curso }

      t.timestamps
    end
  end
end
