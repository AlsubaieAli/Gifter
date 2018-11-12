class HomeController < ApplicationController
  def index
    if current_user
      @reserved = current_user.reserves
    end
  end

  def profile
  end

  def friend
    Relationship.create(follower_id: current_user.id, followed_id: params[:id])
    redirect_to friends_path
  end

  def unfriend
    friend = current_user.active_relationships.find_by(followed_id: params[:id])
    friend.destroy
    redirect_to friends_path
  end

  def friends
    @confirmed = (current_user.active_relationships.all).select { |f| f.followed.active_relationships.find_by(followed_id: current_user.id) != nil }
    @pending = (current_user.active_relationships.all).select { |f| f.followed.active_relationships.find_by(followed_id: current_user.id) == nil }
    @requests = (Relationship.all).select { |r| r.followed_id == current_user.id && current_user.active_relationships.find_by(followed_id: r.follower_id) == nil }
  end

  def reserve
    current_user.reserves.create(reserve_params)
  end

  def search
    @term = params[:term]
    users = User.all
    match = []
    users.each do |user|
      match.push(user) if (user.name.downcase.include? @term.downcase)
    end
    @result = match
  end

  private

  def reserve_params
    params.require(:reserve).permit(gift_id: params[:id])
  end
end
