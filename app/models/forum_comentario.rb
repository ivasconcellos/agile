class ForumComentario < ApplicationRecord
  belongs_to :usuario_curso
  belongs_to :forum
  
  validates_presence_of :texto, :forum_id, :usuario_curso_id
end
