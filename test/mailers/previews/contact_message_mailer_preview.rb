# Preview all emails at http://localhost:3000/rails/mailers/contact_message_mailer
class ContactMessageMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/contact_message_mailer/contact_message
  def contact_message
    ContactMessageMailer.contact_message
  end

end
