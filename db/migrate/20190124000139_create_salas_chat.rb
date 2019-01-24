class CreateSalasChat < ActiveRecord::Migration[5.2]
  def change
    create_table :salas_chat do |t|
      t.string :nome
      t.references :curso, foreign_key: true
      t.references :usuario, foreign_key: true
      t.boolean	:ativo, default: true

      t.timestamps
    end
  end
end
