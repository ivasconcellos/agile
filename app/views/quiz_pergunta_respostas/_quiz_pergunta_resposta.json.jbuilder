json.extract! quiz_pergunta_resposta, :id, :pergunta_id, :descricao, :comentario, :correta, :created_at, :updated_at
json.url quiz_pergunta_resposta_url(quiz_pergunta_resposta, format: :json)
