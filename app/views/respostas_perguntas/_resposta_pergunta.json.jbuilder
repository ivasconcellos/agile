json.extract! resposta_pergunta, :id, :pergunta_id, :descricao, :comentario, :correta, :created_at, :updated_at
json.url resposta_pergunta_url(resposta_pergunta, format: :json)
