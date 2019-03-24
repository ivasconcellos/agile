json.extract! forum_comentario, :id, :usuario_curso_id, :forum_id, :texto, :created_at, :updated_at
json.url forum_comentario_url(forum_comentario, format: :json)
