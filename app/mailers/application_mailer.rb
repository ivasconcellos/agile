class ApplicationMailer < ActionMailer::Base
  default from: 'noreply@iff.edu.br'
  layout 'mailer'

  def mensagens_professor(email)
    @subject = 'AGILE - Mensagem: ' + email.assunto
    @email = email.destinatario.usuario.email
    @mensagem = email.mensagem
    @remetente = email.usuario_curso.nickname
    @conversa = email
    mail to: @email, subject: @subject
  end

  def tarefa_avaliada(tarefa)
  	@subject = 'AGILE: Tarefa avaliada!'
    @email = tarefa.tarefa_aluno.usuario_curso.usuario.email
    @aluno = tarefa.tarefa_aluno.usuario_curso
    @tarefa = tarefa.tarefa_aluno
    mail to: @email, subject: @subject
  end

  def novo_evento(evento)
  	@subject = 'AGILE: Evento! ' + evento.data.strftime("%d/%m/%Y") + ' - ' + evento.hora.strftime("%H:%M:%S") 
    @evento = evento
    mail to: Usuario.joins(:usuario_curso).where('usuario_curso.curso_id = ? and usuarios.ativo = ?', evento.curso.id, true).pluck(:email), subject: @subject
  end

  def nova_badge(badge)
  	@subject = 'AGILE: Nova Badge!!!'
    @email = badge.usuario_curso.usuario.email
    @badge = badge
    mail to: @email, subject: @subject
  end

  def novo_artefato(artefato)
  	@subject = 'AGILE: Novo Artefato!!!'
    @email = artefato.usuario_curso.usuario.email
    @artefato = artefato
    mail to: @email, subject: @subject
  end

  def novo_nivel(usuario)
  	@subject = 'AGILE: Novo Nível!!!'
    @email = usuario.usuario.email
    @aluno = usuario
    @nivel = usuario.nivel
    mail to: @email, subject: @subject
  end

  def comunicado_turma(comunicado)
    @subject = "AGILE - "+ comunicado.assunto
    @mensagem = comunicado.mensagem
    mail to: Usuario.joins(:usuario_curso).where('usuario_curso.curso_id = ? and usuarios.ativo = ?', comunicado.curso.id, true).pluck(:email), subject: @subject
  end

  def evento_cancelado(evento)
    @subject = 'AGILE: Cancelamento de Evento! ' + evento.data.strftime("%d/%m/%Y") + ' - ' + evento.hora.strftime("%H:%M:%S") 
    @evento = evento
    mail to: Usuario.joins(:usuario_curso).where('usuario_curso.curso_id = ? and usuarios.ativo = ?', evento.curso.id, true).pluck(:email), subject: @subject
  end

  def enviar_convite(curso, emails)
    @subject = 'AGILE: Convite para participar do curso: ' + curso.nome
    @curso = curso
    mail to: emails.split(','), subject: @subject
  end

  def inscricao_cancelada(usuario)
    @subject = 'AGILE: Inscrição cancelada no curso: ' + usuario.curso.nome
    @email = usuario.usuario.email
    @aluno = usuario
    @curso = usuario.curso
    mail to: @email, subject: @subject
  end

  def cadastro_curso(usuario)
    @subject = 'AGILE: Cadastro realizado no curso: ' + usuario.curso.nome
    @email = usuario.usuario.email
    @aluno = usuario
    @curso = usuario.curso
    mail to: @email, subject: @subject
  end
end
