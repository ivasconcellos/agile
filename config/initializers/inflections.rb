# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format. Inflections
# are locale specific, and you may define rules for as many different
# locales as you wish. All of these examples are active by default:
ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
	inflect.irregular 'tema_curso', 'tema_cursos'
	inflect.irregular 'curso', 'cursos'
	inflect.irregular 'material', 'materiais'
	inflect.irregular 'usuario_curso', 'usuario_curso'
	inflect.irregular 'forum', 'foruns'
	inflect.irregular 'forum_comentario', 'foruns_comentarios'
	inflect.irregular 'avatar', 'avatares'
	inflect.irregular 'modulo', 'modulos'
	inflect.irregular 'tarefa_avaliacao', 'tarefa_avaliacao'
	inflect.irregular 'sala_chat', 'salas_chat'
	inflect.irregular 'mensagem', 'mensagens'
	inflect.irregular 'badge', 'badges'
	inflect.irregular 'missao', 'missoes'
	inflect.irregular 'nivel', 'niveis'
	inflect.irregular 'quiz', 'quizzes'
	inflect.irregular 'quiz_pergunta', 'quiz_perguntas'
	inflect.irregular 'quiz_pergunta_resposta', 'quiz_pergunta_respostas'
	inflect.irregular 'grupo_curso', 'grupos_cursos'
	inflect.irregular 'badge_aluno', 'badges_alunos'
	inflect.irregular 'artefato_aluno', 'artefatos_alunos'
	inflect.irregular 'quiz_resposta_aluno', 'quiz_respostas_alunos'
	inflect.irregular 'comunicado', 'comunicados'
	inflect.irregular 'dialogo', 'dialogos'
	inflect.irregular 'modulo_ordenacao', 'modulos_ordenacoes'
	inflect.irregular 'curso_certificado', 'curso_certificados'
	inflect.irregular 'faq', 'faqs'
	inflect.irregular 'recompensa', 'recompensas'
end

# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.acronym 'RESTful'
# end
