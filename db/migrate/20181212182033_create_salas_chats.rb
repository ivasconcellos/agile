class CreateSalasChats < ActiveRecord::Migration[5.2]
  def change
    create_table :salas_chats do |t|
      t.string :nome
      t.references :usuario_curso, foreign_key: true
      t.references :curso, foreign_key: true

      t.timestamps
    end
  end
end
