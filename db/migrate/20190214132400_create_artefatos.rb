class CreateArtefatos < ActiveRecord::Migration[5.2]
  def change
    create_table :artefatos do |t|
      t.string :nome
      t.boolean :ativo, default: true
      t.references :tema_curso

      t.timestamps
    end
  end
end
