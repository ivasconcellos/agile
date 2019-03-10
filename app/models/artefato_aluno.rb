class ArtefatoAluno < ApplicationRecord
  belongs_to :usuario_curso
  belongs_to :artefato

  self.per_page = 10

end
