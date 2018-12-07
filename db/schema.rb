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

ActiveRecord::Schema.define(version: 2018_12_06_193150) do

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

  create_table "comentarios", force: :cascade do |t|
    t.bigint "usuario_id"
    t.bigint "forum_id"
    t.text "texto"
    t.bigint "comentario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comentario_id"], name: "index_comentarios_on_comentario_id"
    t.index ["forum_id"], name: "index_comentarios_on_forum_id"
    t.index ["usuario_id"], name: "index_comentarios_on_usuario_id"
  end

  create_table "conteudos", force: :cascade do |t|
    t.string "nome", null: false
    t.text "descricao"
    t.bigint "curso_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "publico", default: true
    t.index ["curso_id"], name: "index_conteudos_on_curso_id"
  end

  create_table "cursos", force: :cascade do |t|
    t.string "nome", null: false
    t.text "descricao"
    t.date "data_inicio"
    t.date "data_termino"
    t.boolean "ativo", default: true
    t.bigint "tema_curso_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "proprietario_id"
    t.string "codigo_acesso", limit: 8, null: false
    t.boolean "publico", default: false
    t.index ["proprietario_id"], name: "index_cursos_on_proprietario_id"
    t.index ["tema_curso_id"], name: "index_cursos_on_tema_curso_id"
  end

  create_table "explicacoes", force: :cascade do |t|
    t.string "nome", null: false
    t.text "descricao"
    t.string "audio"
    t.bigint "conteudo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conteudo_id"], name: "index_explicacoes_on_conteudo_id"
  end

  create_table "foruns", force: :cascade do |t|
    t.string "titulo"
    t.text "descricao"
    t.bigint "curso_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["curso_id"], name: "index_foruns_on_curso_id"
  end

  create_table "materiais", force: :cascade do |t|
    t.string "nome", null: false
    t.text "texto"
    t.string "link"
    t.bigint "conteudo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "publico", default: true
    t.string "arquivo_file_name"
    t.string "arquivo_content_type"
    t.integer "arquivo_file_size"
    t.datetime "arquivo_updated_at"
    t.string "tipo"
    t.string "imagem_file_name"
    t.string "imagem_content_type"
    t.integer "imagem_file_size"
    t.datetime "imagem_updated_at"
    t.string "video_file_name"
    t.string "video_content_type"
    t.integer "video_file_size"
    t.datetime "video_updated_at"
    t.index ["conteudo_id"], name: "index_materiais_on_conteudo_id"
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
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["curso_id"], name: "index_usuario_curso_on_curso_id"
    t.index ["usuario_id"], name: "index_usuario_curso_on_usuario_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nome", default: "", null: false
    t.string "email", default: "", null: false
    t.string "perfil", default: "Aluno", null: false
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
    t.index ["curso_atual_id"], name: "index_usuarios_on_curso_atual_id"
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

  add_foreign_key "comentarios", "comentarios"
  add_foreign_key "comentarios", "foruns"
  add_foreign_key "comentarios", "usuarios"
  add_foreign_key "conteudos", "cursos"
  add_foreign_key "cursos", "tema_cursos"
  add_foreign_key "cursos", "usuarios", column: "proprietario_id"
  add_foreign_key "explicacoes", "conteudos"
  add_foreign_key "foruns", "cursos"
  add_foreign_key "materiais", "conteudos"
  add_foreign_key "usuario_curso", "cursos"
  add_foreign_key "usuario_curso", "usuarios"
  add_foreign_key "usuarios", "cursos", column: "curso_atual_id"
end
