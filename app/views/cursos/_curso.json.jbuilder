json.extract! curso, :id, :nome, :descricao, :data_inicio, :data_termino, :ativo, :tema, :created_at, :updated_at
json.url curso_url(curso, format: :json)
