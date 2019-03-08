class UsuarioResposta < ApplicationRecord
  belongs_to :usuario_curso
  belongs_to :respostas_perguntas
end
