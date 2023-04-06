class ContactsController < ApplicationController
  before_action :set_contact, only: %i[ show update edit destroy]

  def index
    @contacts = Contact.include(:departament).all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save 
      redirect_to departaments_path
    else
      render :new 
    end
    
  end

  private 
  def contact_params 
    params.require(:contact).permit(:departament_id, :name, :telephone, :email)  
  end

  def set_contact
    @contact = Contact.find(params[:id])
  end
end
