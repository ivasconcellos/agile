class CreateCursos < ActiveRecord::Migration[5.2]
  def change
    create_table :cursos do |t|
      t.string :nome, null: false
      t.text :descricao
      t.date :data_inicio
      t.time :hora_inicio
      t.date :data_termino
      t.time :hora_termino
      t.string :codigo_acesso, limit: 8, null: false
      t.boolean :ativo, default: true
      t.boolean :publico, default: false
      t.text  :publico_alvo
      t.text  :criterios_participacao
      t.integer  :carga_horaria
      t.integer  :porcentagem_aprovacao
      t.references :tema_curso, foreign_key: true
      t.references :proprietario, index: true, foreign_key: { to_table: :usuarios }

      t.timestamps
    end
  end
end
