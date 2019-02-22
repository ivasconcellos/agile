class ArtefatoAluno < ApplicationRecord
  belongs_to :usuario_curso
  belongs_to :artefatos
end
