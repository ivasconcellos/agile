class AddCodigoAcessoToCursos < ActiveRecord::Migration[5.2]
  def change
    add_column :cursos, :codigo_acesso, :string, limit: 8, null: false
  end
end
