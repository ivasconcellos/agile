class AddAttachmentArquivoToTarefaEntregars < ActiveRecord::Migration[5.2]
  def self.up
    change_table :tarefa_entregars do |t|
      t.attachment :arquivo
    end
  end

  def self.down
    remove_attachment :tarefa_entregars, :arquivo
  end
end
