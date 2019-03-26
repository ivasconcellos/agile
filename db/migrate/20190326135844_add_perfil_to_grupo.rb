class AddPerfilToGrupo < ActiveRecord::Migration[5.2]
  def change
    add_column :grupos, :perfil, :string
  end
end
