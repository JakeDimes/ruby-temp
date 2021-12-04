class RatingsController < ApplicationController
  def new
    @ratings = Rating.new
    @members = Account.find_by_team_id(session[:current_user_team])
  end
end
