class Notificacao < ApplicationRecord
  belongs_to :usuario_curso

  self.per_page = 10
end
