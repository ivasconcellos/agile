class Ability
  include CanCan::Ability

  def initialize(usuario, admin)
    alias_action :create, :read, :update, to: :perms_without_delete
    alias_action :read, :update, to: :perms_read_and_update
    usuario ||= Usuario.new or admin ||= Admin.new # guest user (not logged in)
    
    
    if admin
      can :manage, :all
    elsif usuario
      if usuario.curso_atual
        usuario_curso = UsuarioCurso.where(usuario_id: usuario.id, curso_id: usuario.curso_atual.id).first
        if !usuario_curso.nil? and usuario_curso.perfil == 'Professor'
          can :perms_read_and_update, Curso
          can :manage, Modulo
          can :manage, Material
          can :manage, UsuarioCurso
          can :manage, Forum
          can :manage, ForumComentario
          can :manage, Tarefa
          can :read, TarefaAluno
          can :perms_without_delete, TarefaAvaliacao
          can :manage, Quiz
          can :manage, Evento
          can :read, Grupo
          can :manage, GrupoCurso
          can :manage, Missao
          can :controle_professor,:controle
          can :manage, SalaChat
          can :manage, Conversa
          can :manage, QuestionGroup
          can :manage, Question
          can :manage, QuizPergunta
          can :manage, QuizPerguntaResposta
          can :manage, Dica
          can :notas_aluno,:notas
          can :read, QuizRespostaAluno
          can :notas_turma, :curso
          can :manage, Comunicado
          can :cancelar_evento, :evento
          can :escolher_equipe, UsuarioCurso
          can :manage, Dialogo
          can :enviar_convite, :curso
          can :reordernar, :modulo_ordenacao
          can :cancelar_inscricao, UsuarioCurso
          can :manage, Recompensa
          can :read, Notificacao
          can :finalizar_completamente_curso, Curso
        elsif !usuario_curso.nil? and usuario_curso.perfil == 'Aluno'
          can :read, Modulo
          can :read, Curso
          can :read, Forum
          can :manage, ForumComentario
          can :perms_read_and_update, UsuarioCurso
          can :read, Tarefa
          can :perms_without_delete, TarefaAluno
          can :manage, Conversa
          can :read, SalaChat
          can :lista_participantes, :grupo_curso
          can :read, Missao
          can :read, Evento
          can :read, Dica
          can :read, QuestionGroup
          can :minhas_notas,:notas
          can :manage, QuizRespostaAluno
          can :read, Material
          can :read, Comunicado
          can :escolher_equipe, UsuarioCurso
          can :read, Dialogo
          can :cancelar_inscricao, UsuarioCurso
          can :finalizar_curso, UsuarioCurso
          can :pendencias, UsuarioCurso
          can :perms_without_delete, SalaChat
          can :read, Recompensa
          can :read, Notificacao
        end
      end
    end
  
     
    
  end
end
