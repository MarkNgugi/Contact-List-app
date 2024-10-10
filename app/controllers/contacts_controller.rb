class ContactsController < ApplicationController
  before_action :set_category, only: [:new, :create, :show]

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


  private

  def set_category
    @category = Category.find(params[:category_id])  # Set the category based on the params
  end

  def contact_params
    params.require(:contact).permit(:firstname, :email, :phonenumber)  # Adjust according to your contact attributes
  end
end
