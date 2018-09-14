class AddAttachmentVideoToMateriais < ActiveRecord::Migration[5.2]
  def self.up
    change_table :materiais do |t|
      t.attachment :video
    end
  end

  def self.down
    remove_attachment :materiais, :video
  end
end
