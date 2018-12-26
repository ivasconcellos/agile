json.extract! tarefa_aluno, :id, :tarefa_id, :usuario_curso, :usuario_curso_id, :nota, :comentario, :created_at, :updated_at
json.url tarefa_aluno_url(tarefa_aluno, format: :json)
