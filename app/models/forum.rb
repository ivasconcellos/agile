class Forum < ApplicationRecord
  belongs_to :curso
  has_many :comentarios
end
