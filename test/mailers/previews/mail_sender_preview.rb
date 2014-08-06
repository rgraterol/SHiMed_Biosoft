# Preview all emails at http://localhost:3000/rails/mailers/mail_sender
class MailSenderPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/mail_sender/sended
  def sended
    MailSender.sended
  end

end
