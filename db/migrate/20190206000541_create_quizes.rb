class CreateQuizes < ActiveRecord::Migration[5.2]
  def change
    create_table :quizes do |t|
      t.references :curso, foreign_key: true
      t.string :nome
      t.text :descricao
      t.integer :max_tentativas
      t.references :usuario_curso, foreign_key: true
      t.date :data_inicio
      t.date :data_termino

      t.timestamps
    end
  end
end
