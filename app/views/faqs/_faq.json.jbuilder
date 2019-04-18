json.extract! faq, :id, :pergunta, :resposta, :created_at, :updated_at
json.url faq_url(faq, format: :json)
