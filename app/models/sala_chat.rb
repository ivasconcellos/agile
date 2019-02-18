class SalaChat < ApplicationRecord
  belongs_to :usuario_curso
  belongs_to :curso
  has_many :mensagens, :dependent => :destroy, :dependent => :restrict_with_error

  validates_presence_of :nome
  
  self.per_page = 10
end
