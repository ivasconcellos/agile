json.extract! avaliacao_tarefa, :id, :tarefa_aluno_id, :nota, :comentario, :usuario_curso_id, :created_at, :updated_at
json.url avaliacao_tarefa_url(avaliacao_tarefa, format: :json)
