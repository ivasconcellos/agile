class ForumComentario < ApplicationRecord
  belongs_to :usuario_curso
  belongs_to :forum
  belongs_to :forum_comentario, :class_name => "ForumComentario", optional: true
  has_many :foruns_comentarios, :foreign_key => "forum_comentario_id"
  
  validates_presence_of :texto, :forum_id, :usuario_curso_id
end
