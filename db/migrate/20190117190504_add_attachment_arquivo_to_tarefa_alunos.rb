class AddAttachmentArquivoToTarefaAlunos < ActiveRecord::Migration[5.2]
  def self.up
    change_table :tarefa_alunos do |t|
      t.attachment :arquivo
    end
  end

  def self.down
    remove_attachment :tarefa_alunos, :arquivo
  end
end
