class DashboardController < ApplicationController
  def admin
    # navbar buttons
    @navbar_buttons = {Accounts: account_path, Teams: teams_path}
  end

  def student

  end



end
