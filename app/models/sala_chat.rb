class SalaChat < ApplicationRecord
  belongs_to :usuario_curso
  belongs_to :curso
end
