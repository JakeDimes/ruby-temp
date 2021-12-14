class HomeController < ApplicationController

  # Root route -> a home page
  def index
    # renders index home page
    @navbar_buttons = {Students: dashboard_student_path}

    # add the admin button to the navbar if the current user is the admin
    if Current.user and Current.user.id == 1
      @navbar_buttons[:Admin] = dashboard_admin_path
    end

  end

end