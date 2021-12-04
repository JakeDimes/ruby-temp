class SessionController < ApplicationController

  def user_name_form

    # renders enter user name form

  end

  def password_form

    # renders enter password form

  end

  # GET request to open the session
  def create

    session[:current_user_id] = params[:id]

  end



end