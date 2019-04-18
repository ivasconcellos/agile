class Faq < ApplicationRecord
    validates_presence_of :pergunta, :resposta
    self.per_page = 10
end
