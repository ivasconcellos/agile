json.extract! email, :id, :usuario_curso_id, :mensagem, :destinatario_id, :created_at, :updated_at
json.url email_url(email, format: :json)
