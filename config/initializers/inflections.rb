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
	inflect.irregular 'explicacao', 'explicacoes'
	inflect.irregular 'forum', 'foruns'
	inflect.irregular 'avatar', 'avatares'
	inflect.irregular 'modulo', 'modulos'
	inflect.irregular 'avaliacao_tarefa', 'avaliacao_tarefa'
	inflect.irregular 'sala_chat', 'salas_chat'
	inflect.irregular 'mensagem', 'mensagens'
	inflect.irregular 'badge', 'badges'
	inflect.irregular 'missao', 'missoes'
	inflect.irregular 'nivel', 'niveis'
	inflect.irregular 'quiz', 'quizes'
	inflect.irregular 'pergunta_quiz', 'perguntas_quiz'
end

# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.acronym 'RESTful'
# end
