class Forum < ApplicationRecord
  belongs_to :curso
  validates_presence_of :titulo, :curso_id
  self.per_page = 10
end
