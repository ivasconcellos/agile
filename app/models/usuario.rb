class Usuario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :nome, :data_nascimento, :sexo, :perfil
  belongs_to :curso_atual, class_name: "Curso", optional: true

  ALUNO = 'Aluno'
  PROFESSOR = 'Professor'

  PERFIL = [
    ALUNO,
    PROFESSOR
  ]

end
