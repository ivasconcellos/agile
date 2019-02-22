class BadgeAluno < ApplicationRecord
  belongs_to :usuario_curso
  belongs_to :badges

  self.per_page = 10
end
