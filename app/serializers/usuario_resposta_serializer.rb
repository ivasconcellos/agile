class UsuarioRespostaSerializer < ActiveModel::Serializer
  attributes :id
  has_one :usuario_curso
  has_one :respostas_perguntas
end
