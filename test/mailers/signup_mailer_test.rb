require 'test_helper'

class SignupMailerTest < ActionMailer::TestCase
  test "signup_message" do
    mail = SignupMailer.signup_message
    assert_equal "Signup message", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
