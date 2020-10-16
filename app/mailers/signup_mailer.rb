class SignupMailer < ApplicationMailer


  def  signup_message(signup)
    @name = signup.name
    @password = signup.password
    @email = signup.email
    mail to: @email,
    subject: default_i18n_subject(name: @name)
  end


end
