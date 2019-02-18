class ApplicationMailer < ActionMailer::Base
  #default from: 'from@example.com'
  layout 'mailer'

  def mensagens_professor(email)
    @subject = email.assunto
    @email = email.destinatario.usuario.email
    @from = email.usuario_curso.usuario.email
    @mensagem = email.mensagem
    mail to: @email, subject: @subject, from: @from
  end

end
