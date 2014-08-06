require 'test_helper'

class MailSenderTest < ActionMailer::TestCase
  test "sended" do
    mail = MailSender.sended
    assert_equal "Sended", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
