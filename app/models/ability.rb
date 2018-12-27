class Ability
  include CanCan::Ability

  def initialize(usuario_curso)
    alias_action :create, :read, :update, to: :perms_without_delete
    alias_action :read, :update, to: :perms_read_and_update
    usuario_curso ||= UsuarioCurso.new # guest user (not logged in)
    if usuario_curso.perfil == 'Professor'
      can :manage, Curso
      can :manage, Conteudo
      can :manage, Explicacao
      can :manage, Material
      can :manage, UsuarioCurso
      can :manage, Forum
      can :manage, Comentario
      can :manage, TemaCurso
      can :manage, Avatar
    elsif usuario_curso.perfil == 'Aluno'
      can :manage, Comentario
      can :perms_read_and_update, UsuarioCurso
    end

    if usuario_curso.usuario.perfil == 'Gestor'
      can :manage, :all
    end
  end
end
