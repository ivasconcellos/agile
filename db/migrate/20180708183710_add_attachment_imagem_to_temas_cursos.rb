class AddAttachmentImagemToTemasCursos < ActiveRecord::Migration[5.2]
  def self.up
    change_table :temas_cursos do |t|
      t.attachment :imagem
    end
  end

  def self.down
    remove_attachment :temas_cursos, :imagem
  end
end
