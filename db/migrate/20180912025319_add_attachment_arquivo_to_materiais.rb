class AddAttachmentArquivoToMateriais < ActiveRecord::Migration[5.2]
  def self.up
    change_table :materiais do |t|
      t.attachment :arquivo
    end
  end

  def self.down
    remove_attachment :materiais, :arquivo
  end
end
