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
        if !usuario_curso.nil? and usuario_curso.perfil == 'Professor'
          can :perms_read_and_update, Curso
          can :manage, Modulo
          can :manage, Explicacao
          can :manage, Material
          can :manage, UsuarioCurso
          can :manage, Forum
          can :manage, Comentario
          can :manage, TemaCurso
          can :manage, Avatar
          can :manage, Tarefa
          can :read, TarefaAluno
          can :manage, AvaliacaoTarefa
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
          can :manage, PerguntaQuiz
          can :manage, RespostaPergunta
          can :manage, Dica
          can :notas_aluno,:notas
          can :read, AlunoResposta
          can :notas_turma, :curso
        elsif !usuario_curso.nil? and usuario_curso.perfil == 'Aluno'
          can :manage, Comentario
          can :read, Modulo
          can :show, Curso
          can :read, Forum
          can :manage, Comentario
          can :manage, Avatar
          can :perms_read_and_update, UsuarioCurso
          can :read, Tarefa
          can :perms_without_delete, TarefaAluno
          can :manage, Conversa
          can :read, SalaChat
          can :lista_participantes, :grupo
          can :read, Missao
          can :read, Explicacao
          can :read, Evento
          can :read, Dica
          can :read, QuestionGroup
          can :minhas_notas,:notas
          can :manage, AlunoResposta
          can :read, Material
        else
          can :read, Curso
        end
      end

    end


    
    
  end
end
