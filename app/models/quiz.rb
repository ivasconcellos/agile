class Quiz < ApplicationRecord
  belongs_to :curso
  belongs_to :usuario_curso
end
