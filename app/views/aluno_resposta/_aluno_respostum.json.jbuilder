json.extract! aluno_respostum, :id, :aluno_curso_id, :respostas_perguntas_id, :correta, :created_at, :updated_at
json.url aluno_respostum_url(aluno_respostum, format: :json)
