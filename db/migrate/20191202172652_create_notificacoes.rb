class CreateNotificacoes < ActiveRecord::Migration[5.2]
  def change
    create_table :notificacoes do |t|
      t.references :usuario_curso, foreign_key: true
      t.string :texto
      t.string :tipo

      t.timestamps
    end
  end
end
