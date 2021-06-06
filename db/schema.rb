# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_06_06_015005) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "nome", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.boolean "ativo", default: true
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "ahoy_events", force: :cascade do |t|
    t.bigint "visit_id"
    t.bigint "usuario_id"
    t.bigint "curso_id"
    t.string "name"
    t.jsonb "properties"
    t.datetime "time"
    t.index ["curso_id"], name: "index_ahoy_events_on_curso_id"
    t.index ["name", "time"], name: "index_ahoy_events_on_name_and_time"
    t.index ["properties"], name: "index_ahoy_events_on_properties_jsonb_path_ops", opclass: :jsonb_path_ops, using: :gin
    t.index ["usuario_id"], name: "index_ahoy_events_on_usuario_id"
    t.index ["visit_id"], name: "index_ahoy_events_on_visit_id"
  end

  create_table "ahoy_visits", force: :cascade do |t|
    t.string "visit_token"
    t.string "visitor_token"
    t.bigint "usuario_id"
    t.string "ip"
    t.text "user_agent"
    t.text "referrer"
    t.string "referring_domain"
    t.text "landing_page"
    t.string "browser"
    t.string "os"
    t.string "device_type"
    t.string "country"
    t.string "region"
    t.string "city"
    t.string "utm_source"
    t.string "utm_medium"
    t.string "utm_term"
    t.string "utm_content"
    t.string "utm_campaign"
    t.string "app_version"
    t.string "os_version"
    t.string "platform"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.index ["usuario_id"], name: "index_ahoy_visits_on_usuario_id"
    t.index ["visit_token"], name: "index_ahoy_visits_on_visit_token", unique: true
  end

  create_table "answer_groups", force: :cascade do |t|
    t.bigint "question_group_id"
    t.string "usuario_curso_type"
    t.bigint "usuario_curso_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_group_id"], name: "index_answer_groups_on_question_group_id"
    t.index ["usuario_curso_type", "usuario_curso_id"], name: "index_answer_groups_on_usuario_curso_type_and_usuario_curso_id"
  end

  create_table "answers", force: :cascade do |t|
    t.bigint "answer_group_id"
    t.bigint "question_id"
    t.text "resposta"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_group_id"], name: "index_answers_on_answer_group_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "areas", force: :cascade do |t|
    t.string "nome"
    t.boolean "ativa", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "artefatos", force: :cascade do |t|
    t.string "nome"
    t.integer "pontos_requeridos"
    t.boolean "ativo", default: true
    t.bigint "tema_curso_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tema_curso_id"], name: "index_artefatos_on_tema_curso_id"
  end

  create_table "artefatos_alunos", force: :cascade do |t|
    t.bigint "usuario_curso_id"
    t.bigint "artefato_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artefato_id"], name: "index_artefatos_alunos_on_artefato_id"
    t.index ["usuario_curso_id"], name: "index_artefatos_alunos_on_usuario_curso_id"
  end

  create_table "avatares", force: :cascade do |t|
    t.bigint "grupo_id"
    t.string "nome"
    t.string "perfil"
    t.boolean "ativo", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["grupo_id"], name: "index_avatares_on_grupo_id"
  end

  create_table "badges", force: :cascade do |t|
    t.string "nome"
    t.integer "pontos_requeridos"
    t.boolean "ativo", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "badges_alunos", force: :cascade do |t|
    t.bigint "usuario_curso_id"
    t.bigint "badge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["badge_id"], name: "index_badges_alunos_on_badge_id"
    t.index ["usuario_curso_id"], name: "index_badges_alunos_on_usuario_curso_id"
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "data_fingerprint"
    t.string "type", limit: 30
    t.integer "width"
    t.integer "height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "comunicados", force: :cascade do |t|
    t.string "assunto"
    t.text "mensagem"
    t.bigint "curso_id"
    t.bigint "remetente_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["curso_id"], name: "index_comunicados_on_curso_id"
    t.index ["remetente_id"], name: "index_comunicados_on_remetente_id"
  end

  create_table "conversas", force: :cascade do |t|
    t.bigint "usuario_curso_id"
    t.string "assunto"
    t.text "mensagem"
    t.bigint "destinatario_id"
    t.boolean "lida", default: false
    t.bigint "conversa_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversa_id"], name: "index_conversas_on_conversa_id"
    t.index ["destinatario_id"], name: "index_conversas_on_destinatario_id"
    t.index ["usuario_curso_id"], name: "index_conversas_on_usuario_curso_id"
  end

  create_table "cursos", force: :cascade do |t|
    t.string "nome", null: false
    t.text "descricao"
    t.date "data_inicio"
    t.time "hora_inicio"
    t.date "data_termino"
    t.time "hora_termino"
    t.string "codigo_acesso", limit: 8, null: false
    t.boolean "ativo", default: true
    t.boolean "publico", default: false
    t.text "publico_alvo"
    t.text "criterios_participacao"
    t.integer "carga_horaria"
    t.integer "porcentagem_aprovacao"
    t.bigint "tema_curso_id"
    t.bigint "proprietario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["proprietario_id"], name: "index_cursos_on_proprietario_id"
    t.index ["tema_curso_id"], name: "index_cursos_on_tema_curso_id"
  end

  create_table "dialogos", force: :cascade do |t|
    t.string "nome"
    t.text "texto"
    t.bigint "usuario_curso_id"
    t.bigint "modulo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["modulo_id"], name: "index_dialogos_on_modulo_id"
    t.index ["usuario_curso_id"], name: "index_dialogos_on_usuario_curso_id"
  end

  create_table "dicas", force: :cascade do |t|
    t.string "nome"
    t.string "descricao"
    t.bigint "missao_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["missao_id"], name: "index_dicas_on_missao_id"
  end

  create_table "eventos", force: :cascade do |t|
    t.date "data"
    t.time "hora"
    t.string "nome"
    t.text "descricao"
    t.boolean "ativo", default: true
    t.bigint "usuario_curso_id"
    t.bigint "curso_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["curso_id"], name: "index_eventos_on_curso_id"
    t.index ["usuario_curso_id"], name: "index_eventos_on_usuario_curso_id"
  end

  create_table "faqs", force: :cascade do |t|
    t.string "pergunta"
    t.text "resposta"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "foruns", force: :cascade do |t|
    t.string "titulo"
    t.text "descricao"
    t.boolean "ativo", default: true
    t.bigint "modulo_id"
    t.bigint "usuario_curso_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["modulo_id"], name: "index_foruns_on_modulo_id"
    t.index ["usuario_curso_id"], name: "index_foruns_on_usuario_curso_id"
  end

  create_table "foruns_comentarios", force: :cascade do |t|
    t.bigint "usuario_curso_id"
    t.bigint "forum_id"
    t.text "texto"
    t.bigint "forum_comentario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["forum_comentario_id"], name: "index_foruns_comentarios_on_forum_comentario_id"
    t.index ["forum_id"], name: "index_foruns_comentarios_on_forum_id"
    t.index ["usuario_curso_id"], name: "index_foruns_comentarios_on_usuario_curso_id"
  end

  create_table "grupos", force: :cascade do |t|
    t.string "nome"
    t.string "perfil"
    t.boolean "ativo", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grupos_cursos", force: :cascade do |t|
    t.bigint "grupo_id"
    t.bigint "curso_id"
    t.string "nome_curso"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["curso_id"], name: "index_grupos_cursos_on_curso_id"
    t.index ["grupo_id"], name: "index_grupos_cursos_on_grupo_id"
  end

  create_table "materiais", force: :cascade do |t|
    t.string "nome", null: false
    t.text "texto"
    t.string "tipo"
    t.boolean "publico", default: true
    t.bigint "modulo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["modulo_id"], name: "index_materiais_on_modulo_id"
  end

  create_table "mensagens", force: :cascade do |t|
    t.string "texto"
    t.bigint "sala_chat_id"
    t.bigint "usuario_curso_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sala_chat_id"], name: "index_mensagens_on_sala_chat_id"
    t.index ["usuario_curso_id"], name: "index_mensagens_on_usuario_curso_id"
  end

  create_table "missoes", force: :cascade do |t|
    t.bigint "modulo_id"
    t.bigint "usuario_curso_id"
    t.string "nome"
    t.text "descricao"
    t.boolean "publico", default: true
    t.string "tipo"
    t.float "pontuacao"
    t.date "data_inicio"
    t.time "hora_inicio"
    t.date "data_termino"
    t.time "hora_termino"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["modulo_id"], name: "index_missoes_on_modulo_id"
    t.index ["usuario_curso_id"], name: "index_missoes_on_usuario_curso_id"
  end

  create_table "modulos", force: :cascade do |t|
    t.string "nome"
    t.text "descricao"
    t.boolean "publico", default: true
    t.bigint "curso_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
    t.index ["curso_id"], name: "index_modulos_on_curso_id"
  end

  create_table "modulos_ordenacoes", force: :cascade do |t|
    t.bigint "modulo_id"
    t.integer "position"
    t.string "classe"
    t.integer "classe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["modulo_id"], name: "index_modulos_ordenacoes_on_modulo_id"
  end

  create_table "niveis", force: :cascade do |t|
    t.string "nome"
    t.integer "pontos_requeridos"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notificacoes", force: :cascade do |t|
    t.bigint "usuario_curso_id"
    t.string "texto"
    t.string "tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_curso_id"], name: "index_notificacoes_on_usuario_curso_id"
  end

  create_table "question_groups", force: :cascade do |t|
    t.string "titulo"
    t.text "descricao"
    t.text "objetivo"
    t.bigint "usuario_curso_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "curso_id"
    t.boolean "final_curso", default: false
    t.index ["curso_id"], name: "index_question_groups_on_curso_id"
    t.index ["usuario_curso_id"], name: "index_question_groups_on_usuario_curso_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "tipo"
    t.string "pergunta"
    t.integer "position"
    t.text "respostas"
    t.text "validation_rules"
    t.bigint "question_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_group_id"], name: "index_questions_on_question_group_id"
  end

  create_table "quiz_pergunta_respostas", force: :cascade do |t|
    t.bigint "quiz_pergunta_id"
    t.text "descricao"
    t.text "comentario"
    t.boolean "correta", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_pergunta_id"], name: "index_quiz_pergunta_respostas_on_quiz_pergunta_id"
  end

  create_table "quiz_perguntas", force: :cascade do |t|
    t.bigint "quiz_id"
    t.text "descricao"
    t.float "pontuacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_id"], name: "index_quiz_perguntas_on_quiz_id"
  end

  create_table "quiz_respostas_alunos", force: :cascade do |t|
    t.bigint "usuario_curso_id"
    t.bigint "quiz_pergunta_resposta_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "quiz_id"
    t.index ["quiz_id"], name: "index_quiz_respostas_alunos_on_quiz_id"
    t.index ["quiz_pergunta_resposta_id"], name: "index_quiz_respostas_alunos_on_quiz_pergunta_resposta_id"
    t.index ["usuario_curso_id"], name: "index_quiz_respostas_alunos_on_usuario_curso_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.bigint "missao_id"
    t.string "nome"
    t.text "descricao"
    t.boolean "finalizado", default: false
    t.bigint "usuario_curso_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["missao_id"], name: "index_quizzes_on_missao_id"
    t.index ["usuario_curso_id"], name: "index_quizzes_on_usuario_curso_id"
  end

  create_table "rapidfire_answers", force: :cascade do |t|
    t.bigint "attempt_id"
    t.bigint "question_id"
    t.text "answer_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attempt_id"], name: "index_rapidfire_answers_on_attempt_id"
    t.index ["question_id"], name: "index_rapidfire_answers_on_question_id"
  end

  create_table "rapidfire_attempts", force: :cascade do |t|
    t.bigint "survey_id"
    t.string "user_type"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_id"], name: "index_rapidfire_attempts_on_survey_id"
    t.index ["user_id", "user_type"], name: "index_rapidfire_attempts_on_user_id_and_user_type"
    t.index ["user_type", "user_id"], name: "index_rapidfire_attempts_on_user_type_and_user_id"
  end

  create_table "rapidfire_questions", force: :cascade do |t|
    t.bigint "survey_id"
    t.string "type"
    t.string "question_text"
    t.string "default_text"
    t.string "placeholder"
    t.integer "position"
    t.text "answer_options"
    t.text "validation_rules"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_id"], name: "index_rapidfire_questions_on_survey_id"
  end

  create_table "rapidfire_surveys", force: :cascade do |t|
    t.string "name"
    t.text "introduction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recompensas", force: :cascade do |t|
    t.integer "posicao_ranking"
    t.string "nome"
    t.text "descricao"
    t.bigint "usuario_curso_id"
    t.bigint "curso_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["curso_id"], name: "index_recompensas_on_curso_id"
    t.index ["usuario_curso_id"], name: "index_recompensas_on_usuario_curso_id"
  end

  create_table "salas_chat", force: :cascade do |t|
    t.string "nome"
    t.bigint "curso_id"
    t.bigint "usuario_curso_id"
    t.boolean "ativo", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["curso_id"], name: "index_salas_chat_on_curso_id"
    t.index ["usuario_curso_id"], name: "index_salas_chat_on_usuario_curso_id"
  end

  create_table "tarefa_alunos", force: :cascade do |t|
    t.bigint "tarefa_id"
    t.bigint "usuario_curso_id"
    t.boolean "avaliada", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tarefa_id"], name: "index_tarefa_alunos_on_tarefa_id"
    t.index ["usuario_curso_id"], name: "index_tarefa_alunos_on_usuario_curso_id"
  end

  create_table "tarefa_avaliacao", force: :cascade do |t|
    t.bigint "tarefa_aluno_id"
    t.float "nota"
    t.text "comentario"
    t.bigint "usuario_curso_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tarefa_aluno_id"], name: "index_tarefa_avaliacao_on_tarefa_aluno_id"
    t.index ["usuario_curso_id"], name: "index_tarefa_avaliacao_on_usuario_curso_id"
  end

  create_table "tarefas", force: :cascade do |t|
    t.bigint "missao_id"
    t.bigint "usuario_curso_id"
    t.text "nome"
    t.text "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["missao_id"], name: "index_tarefas_on_missao_id"
    t.index ["usuario_curso_id"], name: "index_tarefas_on_usuario_curso_id"
  end

  create_table "tema_cursos", force: :cascade do |t|
    t.string "nome", null: false
    t.boolean "ativo", default: true
    t.string "cor_titulo", null: false
    t.string "cor_texto", null: false
    t.string "cor_fundo", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuario_curso", force: :cascade do |t|
    t.string "perfil", default: "Aluno", null: false
    t.string "nickname", null: false
    t.float "pontos_experiencia", default: 0.0
    t.boolean "aprovado"
    t.boolean "curso_finalizado", default: false
    t.string "status_curso", default: "Em andamento"
    t.bigint "usuario_id"
    t.bigint "curso_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "avatar_id"
    t.bigint "grupo_curso_id"
    t.bigint "nivel_id"
    t.index ["avatar_id"], name: "index_usuario_curso_on_avatar_id"
    t.index ["curso_id"], name: "index_usuario_curso_on_curso_id"
    t.index ["grupo_curso_id"], name: "index_usuario_curso_on_grupo_curso_id"
    t.index ["nivel_id"], name: "index_usuario_curso_on_nivel_id"
    t.index ["usuario_id"], name: "index_usuario_curso_on_usuario_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nome", default: "", null: false
    t.string "cpf", null: false
    t.string "email", default: "", null: false
    t.string "perfil", default: "Usuário comum", null: false
    t.date "data_nascimento", null: false
    t.string "sexo", null: false
    t.string "encrypted_password", default: "", null: false
    t.boolean "ativo", default: true
    t.boolean "termo_compromisso", default: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "curso_atual_id"
    t.string "login_token"
    t.index ["curso_atual_id"], name: "index_usuarios_on_curso_atual_id"
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

  add_foreign_key "artefatos_alunos", "artefatos"
  add_foreign_key "artefatos_alunos", "usuario_curso"
  add_foreign_key "avatares", "grupos"
  add_foreign_key "badges_alunos", "badges"
  add_foreign_key "badges_alunos", "usuario_curso"
  add_foreign_key "comunicados", "cursos"
  add_foreign_key "comunicados", "usuario_curso", column: "remetente_id"
  add_foreign_key "conversas", "conversas"
  add_foreign_key "conversas", "usuario_curso"
  add_foreign_key "conversas", "usuario_curso", column: "destinatario_id"
  add_foreign_key "cursos", "tema_cursos"
  add_foreign_key "cursos", "usuarios", column: "proprietario_id"
  add_foreign_key "dialogos", "modulos"
  add_foreign_key "dialogos", "usuario_curso"
  add_foreign_key "dicas", "missoes"
  add_foreign_key "eventos", "cursos"
  add_foreign_key "eventos", "usuario_curso"
  add_foreign_key "foruns", "modulos"
  add_foreign_key "foruns", "usuario_curso"
  add_foreign_key "foruns_comentarios", "foruns"
  add_foreign_key "foruns_comentarios", "foruns_comentarios"
  add_foreign_key "foruns_comentarios", "usuario_curso"
  add_foreign_key "grupos_cursos", "cursos"
  add_foreign_key "grupos_cursos", "grupos"
  add_foreign_key "materiais", "modulos"
  add_foreign_key "mensagens", "salas_chat"
  add_foreign_key "mensagens", "usuario_curso"
  add_foreign_key "missoes", "modulos"
  add_foreign_key "missoes", "usuario_curso"
  add_foreign_key "modulos", "cursos"
  add_foreign_key "notificacoes", "usuario_curso"
  add_foreign_key "question_groups", "cursos"
  add_foreign_key "quiz_pergunta_respostas", "quiz_perguntas"
  add_foreign_key "quiz_perguntas", "quizzes"
  add_foreign_key "quiz_respostas_alunos", "quiz_pergunta_respostas"
  add_foreign_key "quiz_respostas_alunos", "quizzes"
  add_foreign_key "quiz_respostas_alunos", "usuario_curso"
  add_foreign_key "quizzes", "missoes"
  add_foreign_key "quizzes", "usuario_curso"
  add_foreign_key "recompensas", "cursos"
  add_foreign_key "recompensas", "usuario_curso"
  add_foreign_key "salas_chat", "cursos"
  add_foreign_key "salas_chat", "usuario_curso"
  add_foreign_key "tarefa_alunos", "tarefas"
  add_foreign_key "tarefa_alunos", "usuario_curso"
  add_foreign_key "tarefa_avaliacao", "tarefa_alunos"
  add_foreign_key "tarefa_avaliacao", "usuario_curso"
  add_foreign_key "tarefas", "missoes"
  add_foreign_key "tarefas", "usuario_curso"
  add_foreign_key "usuario_curso", "avatares"
  add_foreign_key "usuario_curso", "cursos"
  add_foreign_key "usuario_curso", "grupos_cursos"
  add_foreign_key "usuario_curso", "niveis"
  add_foreign_key "usuario_curso", "usuarios"
  add_foreign_key "usuarios", "cursos", column: "curso_atual_id"
end
