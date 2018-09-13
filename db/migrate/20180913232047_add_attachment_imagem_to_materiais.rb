class AddAttachmentImagemToMateriais < ActiveRecord::Migration[5.2]
  def self.up
    change_table :materiais do |t|
      t.attachment :imagem
    end
  end

  def self.down
    remove_attachment :materiais, :imagem
  end
end
