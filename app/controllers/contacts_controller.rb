class ContactsController < ApplicationController

  def index
    shared_contacts = Contact.contacts_for_user_id(self.params[:user_id])
    render :json => shared_contacts
  end

  def show
    contacts = Contact.find(self.params[:id])
    render :json => contacts
  end

  def create
    contact = Contact.new(self.params[:contact])

    if contact.save
      render :json => contact
    else
      render :json => contact.errors, :status => 422
    end
  end

  def update
    contact = Contact.find(self.params[:id])

    if contact.update_attributes(self.params[:contact])
      render :json => contact
    else
      render :json => contact.errors, :status => 422
    end
  end

  def destroy
    contact = Contact.find(self.params[:id])

    if contact.destroy
      render :json => contact
    else
      render :json => contact.errors, :status => 422
    end
  end
end