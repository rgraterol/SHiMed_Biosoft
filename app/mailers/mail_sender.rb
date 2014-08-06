class MailSender < ActionMailer::Base
  default from: "pruebasJuan837@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mail_sender.sended.subject
  #
  def sended (usuario)
    @usuario = usuario
    @host = 'http://localhost:3000/'
    mail(to: @usuario.email, subject: 'SHiMed-Confirma tu Correo')
  end
end
