class AddFinalizadoToQuizes < ActiveRecord::Migration[5.2]
  def change
    add_column :quizes, :finalizado, :boolean, default: false
  end
end
