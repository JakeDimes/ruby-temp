class ApplicationController < ActionController::Base
  before_action :set_current_account # before any action is run, run set_current_account below

  def set_current_account
    if session[:user_id]
      Current.user = Account.find_by(id: session[:user_id])
    end
  end

  # checks if the user is a) logged in, and b) is an admin
  def check_user_auth

    if Current.user # a user is signed in

      if !(Current.user.id == 1) # user isnt an admin

        flash[:error] = "You must be an admin to access that page"
        redirect_to root_path
      else
        flash[:error] = nil
        @navbar_buttons = {Accounts: account_path, Teams: teams_path, Tasks: tasks_path}
      end

    else # a user isnt signed in

      flash[:error] = "You must sign in"
      redirect_to root_path

    end

  end

end
