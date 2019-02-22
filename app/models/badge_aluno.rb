class BadgeAluno < ApplicationRecord
  belongs_to :usuario_curso
  belongs_to :badges
end
