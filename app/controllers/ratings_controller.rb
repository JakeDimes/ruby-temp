class RatingsController < ApplicationController
  def new

  end

  def delete_rating

    # get the team ID
    eval_id = params[:id]

    # get the team object and delete it
    Rating.find(eval_id).delete

    # redirect
    redirect_to dashboard_admin_ratings_path


  end


end
