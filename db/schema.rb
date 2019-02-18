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

ActiveRecord::Schema.define(version: 2019_02_17_032111) do

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

  create_table "artefatos", force: :cascade do |t|
    t.string "nome"
    t.boolean "ativo", default: true
    t.bigint "tema_curso_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tema_curso_id"], name: "index_artefatos_on_tema_curso_id"
  end

  create_table "avaliacao_tarefa", force: :cascade do |t|
    t.bigint "tarefa_aluno_id"
    t.float "nota"
    t.text "comentario"
    t.bigint "usuario_curso_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tarefa_aluno_id"], name: "index_avaliacao_tarefa_on_tarefa_aluno_id"
    t.index ["usuario_curso_id"], name: "index_avaliacao_tarefa_on_usuario_curso_id"
  end

  create_table "avatares", force: :cascade do |t|
    t.bigint "tema_curso_id"
    t.string "nome"
    t.string "perfil"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "imagem_file_name"
    t.string "imagem_content_type"
    t.integer "imagem_file_size"
    t.datetime "imagem_updated_at"
    t.boolean "ativo", default: true
    t.index ["tema_curso_id"], name: "index_avatares_on_tema_curso_id"
  end

  create_table "badges", force: :cascade do |t|
    t.string "nome"
    t.boolean "ativo", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

<<<<<<< HEAD
=======
  create_table "comentarios", force: :cascade do |t|
    t.bigint "usuario_curso_id"
    t.bigint "forum_id"
    t.text "texto"
    t.bigint "comentario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comentario_id"], name: "index_comentarios_on_comentario_id"
    t.index ["forum_id"], name: "index_comentarios_on_forum_id"
    t.index ["usuario_curso_id"], name: "index_comentarios_on_usuario_curso_id"
  end

  create_table "conversas", force: :cascade do |t|
    t.bigint "usuario_curso_id"
    t.string "assunto"
    t.text "mensagem"
    t.bigint "destinatario_id"
    t.boolean "lido", default: false
    t.bigint "conversa_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversa_id"], name: "index_conversas_on_conversa_id"
    t.index ["destinatario_id"], name: "index_conversas_on_destinatario_id"
    t.index ["usuario_curso_id"], name: "index_conversas_on_usuario_curso_id"
  end

>>>>>>> 5003a337a8c2691889cca530fd99af568e19c63d
  create_table "cursos", force: :cascade do |t|
    t.string "nome", null: false
    t.text "descricao"
    t.date "data_inicio"
    t.date "data_termino"
    t.string "codigo_acesso", limit: 8, null: false
    t.boolean "ativo", default: true
    t.boolean "publico", default: false
    t.bigint "tema_curso_id"
    t.bigint "proprietario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["proprietario_id"], name: "index_cursos_on_proprietario_id"
    t.index ["tema_curso_id"], name: "index_cursos_on_tema_curso_id"
  end

  create_table "explicacoes", force: :cascade do |t|
    t.string "nome", null: false
    t.text "descricao"
    t.string "audio"
    t.bigint "modulo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["modulo_id"], name: "index_explicacoes_on_modulo_id"
  end

  create_table "foruns", force: :cascade do |t|
    t.string "titulo"
    t.text "descricao"
    t.bigint "curso_id"
    t.bigint "usuario_curso_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["curso_id"], name: "index_foruns_on_curso_id"
    t.index ["usuario_curso_id"], name: "index_foruns_on_usuario_curso_id"
  end

  create_table "grupos", force: :cascade do |t|
    t.string "nome"
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
    t.string "link"
    t.string "tipo"
    t.boolean "publico", default: true
    t.bigint "modulo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "arquivo_file_name"
    t.string "arquivo_content_type"
    t.integer "arquivo_file_size"
    t.datetime "arquivo_updated_at"
    t.string "imagem_file_name"
    t.string "imagem_content_type"
    t.integer "imagem_file_size"
    t.datetime "imagem_updated_at"
    t.string "video_file_name"
    t.string "video_content_type"
    t.integer "video_file_size"
    t.datetime "video_updated_at"
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
    t.bigint "curso_id"
    t.bigint "usuario_curso_id"
    t.string "nome"
    t.text "descricao"
    t.boolean "ativo", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["curso_id"], name: "index_missoes_on_curso_id"
    t.index ["usuario_curso_id"], name: "index_missoes_on_usuario_curso_id"
  end

  create_table "modulos", force: :cascade do |t|
    t.string "nome"
    t.text "descricao"
    t.boolean "publico", default: true
    t.bigint "curso_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["curso_id"], name: "index_modulos_on_curso_id"
  end

  create_table "niveis", force: :cascade do |t|
    t.string "nome"
    t.integer "pontos_requeridos"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "perguntas_quiz", force: :cascade do |t|
    t.bigint "quiz_id"
    t.text "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_id"], name: "index_perguntas_quiz_on_quiz_id"
  end

  create_table "quizes", force: :cascade do |t|
    t.bigint "curso_id"
    t.string "nome"
    t.text "descricao"
    t.integer "max_tentativas"
    t.bigint "usuario_curso_id"
    t.date "data_inicio"
    t.date "data_termino"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["curso_id"], name: "index_quizes_on_curso_id"
    t.index ["usuario_curso_id"], name: "index_quizes_on_usuario_curso_id"
  end

  create_table "respostas_perguntas", force: :cascade do |t|
    t.bigint "pergunta_quiz_id"
    t.text "descricao"
    t.text "comentario"
    t.boolean "correta", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pergunta_quiz_id"], name: "index_respostas_perguntas_on_pergunta_quiz_id"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "arquivo_file_name"
    t.string "arquivo_content_type"
    t.integer "arquivo_file_size"
    t.datetime "arquivo_updated_at"
    t.boolean "avaliada", default: false
    t.index ["tarefa_id"], name: "index_tarefa_alunos_on_tarefa_id"
    t.index ["usuario_curso_id"], name: "index_tarefa_alunos_on_usuario_curso_id"
  end

  create_table "tarefas", force: :cascade do |t|
    t.bigint "modulo_id"
    t.bigint "usuario_curso_id"
    t.text "nome"
    t.text "descricao"
    t.float "pontuacao"
    t.boolean "publico", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "data_limite"
    t.time "hora_limite"
    t.index ["modulo_id"], name: "index_tarefas_on_modulo_id"
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
    t.string "imagem_file_name"
    t.string "imagem_content_type"
    t.integer "imagem_file_size"
    t.datetime "imagem_updated_at"
  end

  create_table "usuario_curso", force: :cascade do |t|
    t.string "perfil", default: "Aluno", null: false
    t.string "nickname", null: false
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
    t.string "email", default: "", null: false
    t.string "perfil", default: "Usuário comum", null: false
    t.date "data_nascimento", null: false
    t.string "sexo", null: false
    t.string "encrypted_password", default: "", null: false
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
    t.boolean "ativo", default: true
    t.boolean "termo_compromisso", default: false
    t.index ["curso_atual_id"], name: "index_usuarios_on_curso_atual_id"
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

  add_foreign_key "avaliacao_tarefa", "tarefa_alunos"
  add_foreign_key "avaliacao_tarefa", "usuario_curso"
  add_foreign_key "avatares", "tema_cursos"
<<<<<<< HEAD
=======
  add_foreign_key "comentarios", "comentarios"
  add_foreign_key "comentarios", "foruns"
  add_foreign_key "comentarios", "usuario_curso"
  add_foreign_key "conversas", "conversas"
  add_foreign_key "conversas", "usuario_curso"
  add_foreign_key "conversas", "usuario_curso", column: "destinatario_id"
>>>>>>> 5003a337a8c2691889cca530fd99af568e19c63d
  add_foreign_key "cursos", "tema_cursos"
  add_foreign_key "cursos", "usuarios", column: "proprietario_id"
  add_foreign_key "explicacoes", "modulos"
  add_foreign_key "foruns", "cursos"
  add_foreign_key "foruns", "usuario_curso"
  add_foreign_key "grupos_cursos", "cursos"
  add_foreign_key "grupos_cursos", "grupos"
  add_foreign_key "materiais", "modulos"
  add_foreign_key "mensagens", "salas_chat"
  add_foreign_key "mensagens", "usuario_curso"
  add_foreign_key "missoes", "cursos"
  add_foreign_key "missoes", "usuario_curso"
  add_foreign_key "modulos", "cursos"
  add_foreign_key "perguntas_quiz", "quizes"
  add_foreign_key "quizes", "cursos"
  add_foreign_key "quizes", "usuario_curso"
  add_foreign_key "respostas_perguntas", "perguntas_quiz"
  add_foreign_key "salas_chat", "cursos"
  add_foreign_key "salas_chat", "usuario_curso"
  add_foreign_key "tarefa_alunos", "tarefas"
  add_foreign_key "tarefa_alunos", "usuario_curso"
  add_foreign_key "tarefas", "modulos"
  add_foreign_key "tarefas", "usuario_curso"
  add_foreign_key "usuario_curso", "avatares"
  add_foreign_key "usuario_curso", "cursos"
  add_foreign_key "usuario_curso", "grupos_cursos"
  add_foreign_key "usuario_curso", "niveis"
  add_foreign_key "usuario_curso", "usuarios"
  add_foreign_key "usuarios", "cursos", column: "curso_atual_id"
end
