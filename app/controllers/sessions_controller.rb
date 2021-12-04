class SessionsController < ApplicationController
  def create
    session[:current_user_id] = @dotnum
    session[:current_user_team] = @team_id
  end
end
