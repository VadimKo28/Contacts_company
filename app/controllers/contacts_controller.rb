class ContactsController < ApplicationController
  before_action :status_user, only: %i[edit new]
  before_action :authenticate_user!
  before_action :set_contact, only: %i[ show update edit destroy ]

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

  def edit 
    
  end

  def update
    if @contact.update(contact_params)
      redirect_to departaments_path,  notice: 'Контакт обновлён'
    else 
      render :edit
    end
  end

  def destroy 
    @contact.destroy 
    redirect_to departaments_path, notice: 'Контакт удалён'
  end

  private

  def contact_params
    params.require(:contact).permit(:departament_id, :name, :telephone, :email)
  end

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def status_user
    if current_user.status == 1
      true
    else 
      render "contacts/index"
    end
  end
end
