class CursoCertificado < ApplicationRecord
  belongs_to :usuario
  belongs_to :curso

  before_create :gerar_hash_validacao

  validates :usuario, uniqueness: { scope: :curso }

  protected

  def gerar_hash_validacao
    self.hash_validacao = SecureRandom.urlsafe_base64[0...15]
    gerar_hash_validacao if CursoCertificado.exists?(hash_validacao: self.hash_validacao)
  end
end
