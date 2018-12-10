json.extract! comentario, :id, :usuario_curso_id, :forum_id, :texto, :created_at, :updated_at
json.url comentario_url(comentario, format: :json)
