json.extract! tarefa_entregar, :id, :tarefa_id, :usuario_curso_id, :comentario, :created_at, :updated_at
json.url tarefa_entregar_url(tarefa_entregar, format: :json)
