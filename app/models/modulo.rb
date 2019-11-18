class Modulo < ApplicationRecord
  belongs_to :curso 
  has_many :materiais, :dependent => :destroy, :dependent => :restrict_with_error
  has_many :missoes, :dependent => :destroy, :dependent => :restrict_with_error
  has_many :dialogos, :dependent => :destroy, :dependent => :restrict_with_error
  has_many :modulos_ordenacoes, :dependent => :destroy, :dependent => :restrict_with_error
  has_many :foruns, :dependent => :destroy, :dependent => :restrict_with_error
  
  validates_presence_of :nome, :curso_id
  
  self.per_page = 10
end
