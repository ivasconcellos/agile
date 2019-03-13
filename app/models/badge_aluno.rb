class BadgeAluno < ApplicationRecord
  belongs_to :usuario_curso
  belongs_to :badge

  validates :badge, uniqueness: { scope: :usuario_curso }

  self.per_page = 10

end
