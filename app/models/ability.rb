class Ability
  include CanCan::Ability

  def initialize(usuario)
    alias_action :create, :read, :update, to: :perms_without_delete
    usuario ||= Usuario.new # guest user (not logged in)
    if usuario.perfil == 'Professor'
      can :read, :all
      can :perms_without_delete, Curso
      #can :perms_without_delete, TemaCurso
      can :manage, Conteudo
      can :manage, Explicacao
      can :manage, Material
      can :manage, UsuarioCurso
      can :manage, Forum
    elsif usuario.perfil == 'Aluno'
        can :read, :all
    end
  end
end
