class ContactMessageMailer < ApplicationMailer


  def  contact_message(contact)
    @name = contact.name
    @message = contact.message
    mail to: contact.email,
    subject: default_i18n_subject(name: @name)
  end

  
end
