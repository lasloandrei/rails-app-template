class ContactsController < ApplicationController
  api :GET, '/contacts'
  def index
    render json: Contact.all
    @contacts = Contact.all
  end

  def show
    #render json: Contact.find(params[:id])
    @contact = Contact.find(params[:id])
  end

  def new
    @contact = Contact.new
    # @contacts = Contact.find(params[:id])
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to contacts_path, notice: 'Your Contact was created !'
      # flash[:notice] = "Contact successfully created."
    else
      render 'new'
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :phone_number, :email)
  end

  def update
    @contact = Contact.find(params[:id])
      if @contact.update_attributes(contact_params)
        redirect_to contacts_path, notice: 'Your Contact was updated !'
      else
        render 'edit'
      end
  end
  
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to contacts_path, notice: 'Your Contact was deleted !'
  end
end
