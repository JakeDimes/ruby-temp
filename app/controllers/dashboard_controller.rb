class DashboardController < ApplicationController

  # GET to: dashboard/admin - renders admin dashboard
  def admin

    # check that user is an admin
    check_user_auth
  end

  def student

  end
end
