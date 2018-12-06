json.extract! forum, :id, :titulo, :descricao, :curso_id, :created_at, :updated_at
json.url forum_url(forum, format: :json)
