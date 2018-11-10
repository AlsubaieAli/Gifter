class HomeController < ApplicationController
  def index
  end

  def profile
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
