class Ability
  include CanCan::Ability

  def initialize(usuario)
    alias_action :create, :read, :update, to: :perms_without_delete
    usuario ||= Usuario.new # guest user (not logged in)
    if usuario.perfil == 'Professor'
      can :manage, :all
    elsif usuario.perfil == 'Aluno'
      can :manage, :all
        can :read, :all
    end
  end
end
