class AddPublicoToConteudos < ActiveRecord::Migration[5.2]
  def change
    add_column :conteudos, :publico, :boolean, default: true
  end
end
