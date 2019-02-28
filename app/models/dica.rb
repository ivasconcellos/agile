class Dica < ApplicationRecord
  belongs_to :missao
  self.per_page = 10

end
