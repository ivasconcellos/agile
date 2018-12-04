class Comentario < ApplicationRecord
  belongs_to :usuario
  belongs_to :forum
  has_many :comentarios 
end
