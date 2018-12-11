class AddAttachmentImagemToAvatares < ActiveRecord::Migration[5.2]
  def self.up
    change_table :avatares do |t|
      t.attachment :imagem
    end
  end

  def self.down
    remove_attachment :avatares, :imagem
  end
end
