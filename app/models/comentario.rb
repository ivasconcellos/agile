class Comentario < ApplicationRecord
  belongs_to :usuario
  belongs_to :forum
  belongs_to :comentario
end
