# Preview all emails at http://localhost:3000/rails/mailers/signup_mailer
class SignupMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/signup_mailer/signup_message
  def signup_message
    SignupMailer.signup_message
  end

end
