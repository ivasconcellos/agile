json.extract! tarefa_avaliacao, :id, :tarefa_aluno_id, :nota, :comentario, :usuario_curso_id, :created_at, :updated_at
json.url tarefa_avaliacao_url(tarefa_avaliacao, format: :json)
