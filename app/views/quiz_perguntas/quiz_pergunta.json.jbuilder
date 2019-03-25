json.extract! quiz_pergunta, :id, :quiz_id, :descricao, :created_at, :updated_at
json.url quiz_pergunta_url(quiz_pergunta, format: :json)
