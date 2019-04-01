class CreateCursoCertificados < ActiveRecord::Migration[5.2]
  def change
    create_table :curso_certificados do |t|
      t.references :usuario, foreign_key: true
      t.references :curso, foreign_key: true
      t.string :hash_validacao
      t.datetime :data_finalizacao, default: -> { 'CURRENT_TIMESTAMP' }

      t.timestamps
    end
  end
end
