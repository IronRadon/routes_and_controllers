class ContactSharesController < ApplicationController

  def create
    contactshare = ContactShare.new(self.params[:contactshare])
    if contactshare.save
      render :json => contactshare
    else
      render :json => contactshare.errors, :status => 422
    end
  end

  def destroy
    contactshare = ContactShare.find(self.params[:id])
    if contactshare.destroy
      render :json => contactshare
    else
      render :json => contactshare.errors, :status => 422
    end
  end

end