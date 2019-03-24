json.extract! comunicado, :id, :assunto, :mensagem, :remetente, :created_at, :updated_at
json.url comunicado_url(comunicado, format: :json)
