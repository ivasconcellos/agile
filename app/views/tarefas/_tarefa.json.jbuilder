json.extract! tarefa, :id, :conteudo_id, :usuario_id, :texto, :pontuacao, :created_at, :updated_at
json.url tarefa_url(tarefa, format: :json)
