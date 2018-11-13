class HomeController < ApplicationController
  def index
    if user_signed_in?
      @reserved_from_me = []
      current_user.gifts.each do |gift|
        if Reserve.find_by(gift_id: gift.id) != nil
          @reserved_from_me.push(gift)
        end
      end
    end
  end

  def profile
  end

  def friend
    Relationship.create(follower_id: current_user.id, followed_id: params[:id])
    redirect_to request.referer
  end

  def unfriend
    friend = current_user.active_relationships.find_by(followed_id: params[:id])
    friend.destroy
    redirect_to request.referer
  end

  def friends
    @confirmed = (current_user.active_relationships.all).select { |f| f.followed.active_relationships.find_by(followed_id: current_user.id) != nil }
    @pending = (current_user.active_relationships.all).select { |f| f.followed.active_relationships.find_by(followed_id: current_user.id) == nil }
    @requests = (Relationship.all).select { |r| r.followed_id == current_user.id && current_user.active_relationships.find_by(followed_id: r.follower_id) == nil }
  end

  def reserve
    current_user.reserves.create(gift_id: params[:id])
    redirect_to request.referer
  end

  def unreserve
    reserved = current_user.reserves.find_by(gift_id: params[:id])
    reserved.destroy
    redirect_to request.referer
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
end
