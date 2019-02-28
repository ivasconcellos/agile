class Usuario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :nome, :data_nascimento, :sexo, :perfil, :termo_compromisso
  belongs_to :curso_atual, class_name: "Curso", optional: true
  has_many :usuario_curso, :dependent => :destroy

  self.per_page = 10
  
  USUARIO_COMUM = 'Usuário'
  GESTOR_DO_SISTEMA = 'Gestor'

  PERFIL = [
    USUARIO_COMUM,
    GESTOR_DO_SISTEMA
  ]

  def active_for_authentication?
    if ativo?
      super && ativo?
    end
  end
  
end
