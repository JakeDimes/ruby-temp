class ApplicationController < ActionController::Base
  before_action :set_current_account # before any action is run, run set_current_account below

  def set_current_account
    if session[:user_id]
      Current.user = Account.find_by(id: session[:user_id])
    end
  end
end
