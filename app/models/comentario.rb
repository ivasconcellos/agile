class Comentario < ApplicationRecord
  belongs_to :usuario
  belongs_to :forum
  validates_presence_of :texto, :forum_id, :usuario_id
end
