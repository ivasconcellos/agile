class CreateGrupos < ActiveRecord::Migration[5.2]
  def change
    create_table :grupos do |t|
      t.string :nome
      t.string :perfil
      t.boolean :ativo, default: true

      t.timestamps
    end
  end
end
