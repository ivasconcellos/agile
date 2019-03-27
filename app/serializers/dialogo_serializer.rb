class DialogoSerializer < ActiveModel::Serializer
  attributes :id, :titulo, :texto
  has_one :usuario_curso
  has_one :modulo
end
