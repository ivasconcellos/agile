class Ability
  include CanCan::Ability

  def initialize(usuario)
    alias_action :create, :read, :update, to: :perms_without_delete
    alias_action :read, :update, to: :perms_read_and_update
    usuario ||= Usuario.new # guest user (not logged in)
    if usuario.perfil == 'Gestor'
      can :manage, :all
    else

      if usuario.curso_atual
        usuario_curso = UsuarioCurso.where(usuario_id: usuario.id, curso_id: usuario.curso_atual.id).first
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
      end

    end
   

    
    
  end
end
