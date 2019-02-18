class ApplicationMailer < ActionMailer::Base
  default from: 'noreply@iff.edu.br'
  layout 'mailer'

  def mensagens_professor(email)
    @subject = 'AGILE: ' + email.assunto
    @email = email.destinatario.usuario.email
    @mensagem = email.mensagem
    mail to: @email, subject: @subject
  end

end
