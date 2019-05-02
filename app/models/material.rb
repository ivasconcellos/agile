class Material < ApplicationRecord
  belongs_to :modulo
  validates_presence_of :nome
  self.per_page = 10
  
  has_one_attached :arquivo
  validates :arquivo, size: { less_than: 30.megabytes , message: 'Arquivo muito grande. O tamanho máximo deve ser 30 MB.' }    
  
  validate :validate_content_type
  def validate_content_type
    
    if self.tipo == "Link"
      validates_format_of :texto, :with => /\A((http|https):\/\/){0,1}[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,3}(:[0-9]{1,5})?(\/.*)?\z/, message: "Link inválido!"
    end

    if self.tipo == "Imagem"
      if arquivo.attached? && !arquivo.content_type.in?(["image/png", "image/jpg", "image/jpeg"])
        errors.add(:arquivo, "Formato de arquivo inválido!")
      end      
    end

    if self.tipo == "Arquivo"
      if arquivo.attached? && !arquivo.content_type.in?(["application/pdf", 
        "application/msword", 
        "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
        "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
        "application/vnd.oasis.opendocument.spreadsheet"])
        errors.add(:arquivo, "Formato de arquivo inválido!")
      end
    end
    
    if self.tipo == "Vídeo"
      if arquivo.attached? && !arquivo.content_type.in?(["video/x-flv", "video/mp4", "video/quicktime", "video/x-msvideo", "video/x-ms-wmv"])
        errors.add(:arquivo, "Formato de arquivo inválido!")
      end
    end
  end
     
  after_create :ordenacao

  def ordenacao
    ModuloOrdenacao.ordenar(self)
  end
end

