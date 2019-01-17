json.extract! tarefa, :id, :conteudo_id, :usuario_curso_id, :descricao, :pontuacao, :created_at, :updated_at
json.url tarefa_url(tarefa, format: :json)
