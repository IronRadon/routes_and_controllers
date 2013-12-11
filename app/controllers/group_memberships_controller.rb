class GroupMembershipsController < ApplicationController

  def create
    membership = GroupMembership.new(self.params[:membership])

    if membership.save
      render :json => membership
    else
      render :json => membership.errors, :status => 422
    end
  end

  def destroy
    membership = GroupMembership.find(self.params[:id])

    if membership.destroy
      render :json => membership
    else
      render :json => membership.errors, :status => 422
    end
  end
end