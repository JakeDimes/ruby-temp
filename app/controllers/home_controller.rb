class HomeController < ApplicationController

  def index
    # renders index home page
    @navbar_buttons = {Students: dashboard_student_path, Admin: dashboard_admin_path}

  end

end