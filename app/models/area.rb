class Area < ApplicationRecord
    validates_presence_of :nome
    self.per_page = 10
end
