class RatingsController < ApplicationController
  def new

    @ratings = Rating.new
    @members = Account.find_by_team_id(session[:current_user_team])
    #maybe @members = Account.find_by_team_id(Current.user.team_id)
  end

  def delete_rating

    # get the team ID
    eval_id = params[:id]

    # get the team object and delete it
    Rating.find(eval_id).delete

    # redirect
    #redirect_to dashboard_admin_ratings_path


  end



end
