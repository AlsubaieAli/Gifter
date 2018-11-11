class HomeController < ApplicationController
  def index
  end

  def profile
  end

  def friend
    Relationship.create(follower_id: current_user.id, followed_id: params[:id])
    redirect_to friends_path
  end

  def unfriend
    # relation = Relationship.find_by()
  end

  def friends
    @friends = current_user.active_relationships
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
