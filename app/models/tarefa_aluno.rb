class TarefaAluno < ApplicationRecord
  belongs_to :tarefa
  belongs_to :usuario_curso
  has_one :avaliacao_tarefa

  self.per_page = 10

  validates :tarefa, uniqueness: { scope: :usuario_curso }
  
  has_one_attached :arquivo
  validates :arquivo, attached: true, size: { less_than: 10.megabytes , message: 'Imagem muito grande. Máximo de 10 MB.' }
  
  validate :validate_content_type

  def validate_content_type
    if arquivo.attached? && !arquivo.content_type.in?(["application/pdf", 
        "application/msword", 
        "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
        "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
        "application/vnd.oasis.opendocument.spreadsheet"])
        errors.add(:arquivo, "Formato de arquivo inválido!")
    end
  end

end
