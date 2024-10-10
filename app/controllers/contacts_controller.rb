class ContactsController < ApplicationController
  before_action :set_category, only: [:new, :create, :show, :edit, :update]

  def show
    @contact = Contact.find(params[:id])
  end

  def new
    @contact = @category.contacts.new
  end

  def create
    @contact = @category.contacts.new(contact_params)

    if @contact.save
      redirect_to category_contacts_path(@category),notice: "Contact was successfully deleted."
    else
      render :new
    end
  end

  def edit
    @contact = @category.contacts.find(params[:id])  
  end

  def update
    @contact = @category.contacts.find(params[:id])  
    if @contact.update(contact_params)
      redirect_to category_contacts_path(@category), notice: 'Contact was successfully updated.'
    else
      render :edit
    end
  end


  private

  def set_category
    @category = Category.find(params[:category_id])  
  end

  def contact_params
    params.require(:contact).permit(:firstname, :email, :phonenumber)  
  end
end
