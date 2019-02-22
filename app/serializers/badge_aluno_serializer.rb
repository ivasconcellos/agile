class BadgeAlunoSerializer < ActiveModel::Serializer
  attributes :id
  has_one :usuario_curso
  has_one :badges
end
