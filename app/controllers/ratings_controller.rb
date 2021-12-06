class RatingsController < ApplicationController
  def new

    @ratings = Rating.new
    #@eval_id = params[:eval_id]
    #@members = Account.where
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

  def create_rating
    #get stuff from params
    rating_data = params[:rating]

    rating = Rating.new
    rating.rating_student = Current.user.id
    rating.rated_student = params[:rated_student]
    rating.rating = rating_data[:rating]
    rating.comment = rating_data[:comment]
    rating.eval_id = params[:eval_id]

    rating.save
    #redirect_to dashboard_student_path
  end


end
