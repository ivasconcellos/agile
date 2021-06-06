class Area < ApplicationRecord
    has_many :cursos
    
    validates_presence_of :nome
    self.per_page = 10
end
