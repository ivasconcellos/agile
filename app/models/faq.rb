class Faq < ApplicationRecord
    validates_presence_of :pergunta, :resposta
end
