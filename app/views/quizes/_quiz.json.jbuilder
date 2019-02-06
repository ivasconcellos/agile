json.extract! quiz, :id, :curso_id, :nome, :descricao, :max_tentativas, :usuario_curso_id, :data_inicio, :data_termino, :created_at, :updated_at
json.url quiz_url(quiz, format: :json)
