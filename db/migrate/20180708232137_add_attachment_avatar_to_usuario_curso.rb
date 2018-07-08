class AddAttachmentAvatarToUsuarioCurso < ActiveRecord::Migration[5.2]
  def self.up
    change_table :usuario_curso do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :usuario_curso, :avatar
  end
end
