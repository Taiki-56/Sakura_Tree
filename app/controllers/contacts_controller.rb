class ContactsController < ApplicationController


    def new
      @contact = Contact.new
    end


    def create
      @contact = Contact.new(
        name: params[:name],
        email: params[:email],
        message: params[:message]
      )
      if @contact.save
        ContactMessageMailer.contact_message(@contact).deliver_now
        redirect_to("/posts/index")
        flash[:notice] = t "layouts.flash.notice"
      else
        @error_message = t ".error_message"
        @name = params[:name]
        @email = params[:email]
        @message = params[:message]
        render("contacts/new")
      end
    end


end
