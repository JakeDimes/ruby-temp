class UserspaceController < ApplicationController

  def index
    # renders default page

  end

  # user wishes to update their password: PUT request to userspace/index
  def update_password

    if Current.user.authenticate(params[:old_password]) # old password exists

      Current.user.password = params[:password]
      Current.user.password_confirmation = params[:password_confirmation]
      flash[:error] = nil
      unless Current.user.save
        flash[:error] = "Information Incorrect"
      end

    else

      flash[:error] = "Information Incorrect"

    end

    redirect_to userspace_path, method: :get

  end

end