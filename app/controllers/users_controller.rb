class UsersController < ApplicationController

  def index
    @users = User.all

    render :json => @users
  end

  def create
    user = User.new(self.params[:user])
    if user.save
      render :json => user
    else
      render :json => user.errors, :status => 422
    end
  end

  def show
    user = User.find(self.params[:id])

    render :json => user
  end

  def destroy
    user = User.find(self.params[:id])
    if user.destroy
      render :json => user
    else
      render :json => user.errors, :status => :unprocessable_entity
    end
  end

  def update
    user = User.find(self.params[:id])

    if user.update_attributes(self.params[:user])
      render :json => user
    else
      render :json => user.errors, :status => 422
    end
  end

  def favorite
    favorites = Contact.favorite_contacts_for_user_id(self.params[:user_id])

    render :json => favorites
  end

end
