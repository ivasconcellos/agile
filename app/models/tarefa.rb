class Tarefa < ApplicationRecord
  belongs_to :conteudo
  belongs_to :usuario_curso
end
