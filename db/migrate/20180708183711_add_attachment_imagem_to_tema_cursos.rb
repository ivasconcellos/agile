class AddAttachmentImagemToTemaCursos < ActiveRecord::Migration[5.2]
  def self.up
    change_table :tema_cursos do |t|
      t.attachment :imagem
    end
  end

  def self.down
    remove_attachment :tema_cursos, :imagem
  end
end
