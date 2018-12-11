class AddAvatarToUsuarioCurso < ActiveRecord::Migration[5.2]
  def change
    add_reference :usuario_curso, :avatar, foreign_key: true
  end
end
