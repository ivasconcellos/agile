class Material < ApplicationRecord
  belongs_to :modulo
  validates_presence_of :nome

  self.per_page = 10

  #has_attached_file :arquivo, styles: {medium: "300x300", thumb:"100x100"}, default_url: "/images/:style/missing.png"

  has_one_attached :arquivo
  validates :arquivo, size: { less_than: 10.megabytes , message: 'is not given between size' }    
  
  validate :validate_content_type
  def validate_content_type
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
  
     
end

