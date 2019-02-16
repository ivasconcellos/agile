json.extract! conversa, :id, :usuario_curso_id, :mensagem, :destinatario_id, :created_at, :updated_at
json.url conversa_url(conversa, format: :json)
