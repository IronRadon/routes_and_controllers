class GroupsController < ApplicationController

  def index
    @groups = Group.groups_for_user_id(self.params[:user_id])
    render :json => @groups
  end

  def create
    group = Group.new(self.params[:group])

    if group.save
      render :json => group
    else
      render :json => group.errors, :status => 422
    end
  end

  def destroy
    group = Group.find(self.params[:id])

    if group.destroy
      render :json => group
    else
      render :json => group.errors, :status => 422
    end
  end
end
