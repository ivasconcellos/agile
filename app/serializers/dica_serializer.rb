class DicaSerializer < ActiveModel::Serializer
  attributes :id, :nome, :descricao, :ativo
  has_one :missao
end
