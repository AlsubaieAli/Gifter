class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    @isFriend = false
    @isFriend = true if @user.active_relationships.find_by(followed_id: current_user.id) && current_user.active_relationships.find_by(followed_id: @user.id)
  end
end
