class ArtefatoAluno < ApplicationRecord
  belongs_to :usuario_curso
  belongs_to :artefato

  validates :artefato, uniqueness: { scope: :usuario_curso }

  self.per_page = 10

end
