class ApplicationMailer < ActionMailer::Base
  default from: 'noreply@iff.edu.br'
  layout 'mailer'

  def mensagens_professor(email)
    @subject = 'AGILE: ' + email.assunto
    @email = email.destinatario.usuario.email
    @mensagem = email.mensagem
    mail to: @email, subject: @subject
  end

  def tarefa_avaliada(tarefa)
  	@subject = 'AGILE: Tarefa avaliada!'
    @email = tarefa.tarefa_aluno.usuario_curso.email
    @aluno = tarefa.tarefa_aluno.usuario_curso.nickname
    @tarefa = tarefa.tarefa_aluno
    mail to: @email, subject: @subject
  end

  def novo_evento(evento)
  	@subject = 'AGILE: Evento!' + evento.data.strftime("%d/%m/%Y") + ' ' + evento.hora.strftime("%H:%M:%S") 
    @evento = evento
    mail to: Usuario.join(:usuario_curso).where('usuario_curso.curso_id = ? and usuario.ativo = ?', evento.curso.id, true).pluck[:email], subject: @subject
  end

  def nova_badge(badge)
  	@subject = 'AGILE: Nova Badge!!!'
    @email = badge.usuario_curso.email
    @badge = badge
    mail to: @email, subject: @subject
  end

  def novo_artefato(artefato)
  	@subject = 'AGILE: Novo Artefato!!!'
    @email = artefato.usuario_curso.email
    @artefato = artefato
    mail to: @email, subject: @subject
  end

  def novo_nivel(usuario)
  	@subject = 'AGILE: Novo Nível!!!'
    @email = usuario.email
    @aluno = usuario.nickname
    @nivel = usuario.nivel
    mail to: @email, subject: @subject
  end
end
