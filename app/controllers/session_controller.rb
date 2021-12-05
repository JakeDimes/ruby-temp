class SessionController < ApplicationController

  def user_name_form

    # check if their exists an admin (Account with ID 1)

    unless Account.exists?(1) # no account exists

      redirect_to session_admin_path, method: :get

    end # render if an admin exists

    # renders enter user name form

  end

  def create_admin_account # called when no admin account exists on login

    # for the form with model
    @account = Account.new

    # render form
  end

  def save_admin_account # called when no admin account exists on login

    # for the form with model
    account = Account.new

    # account data
    acc_data = params[:account]

    #check that passwords match
    if acc_data[:pswd_one].eql? acc_data[:pswd_two]

      #save the account
      account.id = 1
      account.fname = acc_data[:fname]
      account.lname = acc_data[:lname]
      account.dotnum = acc_data[:dotnum]
      account.email = acc_data[:email]
      account.password = acc_data[:pswd_one]

      # save it
      account.save

    else

      # flash and return back
      flash[:password_error] = "Passwords do not match"
      redirect_to session_admin_path, method: :get

    end

    # send back to home
    redirect_to root_path

  end


  def password_form

    # get the user's email
    # @ so email can be sent to the password view
    @email = params[:entered_uname]

    # check if this user has a passowrd
    account = Account.find_by(email: @email)
    unless account.nil? # account exists

      if account.password.eql? "" # no password set

        # get their id
        id = account.id
        # redirect to update password
        redirect_to session_setpassword_path(:email => @email, :id => id), method: :get

      end

    end

    # renders enter password form

  end

  # the user is requested tp create a password on login
  def update_password

    # get the user's email
    # @ so email can be sent to the password view
    @id = params[:id]
    @email = params[:email]


  end

  # put the password in the Account object
  def confirm_password

    # get email and id
    email = params[:email]
    id = params[:id]

    # check that passwords match
    pass_one = params[:pswd_one]
    pass_two = params[:pswd_two]

    if pass_one.eql? pass_two

      # update the password and send back to home
      account = Account.find(id)
      account.password = pass_one
      account.save

      redirect_to root_path

    else

      # redirect back
      flash[:not_confirmed] = "Passwords do not match"
      redirect_to session_setpassword_path(:email => email, :id => id), method: :get

    end

  end

  # GET request to open the session
  def create

    # get the login information
    email = params[:email]
    password = params[:entered_pswd]

    # validate the information
    account = Account.find_by(email: email)

    if account.nil? # no user with that email exists

      # redirect flash error
      flash[:login_error] = "Account information incorrect"
      redirect_to session_username_path, method: :get

    else  # a user with that email exists

      stored_pswd = account.password

      if stored_pswd.eql? password # passwords match

        # open the session
        session[:user_id] = account.id

        # redirect to home
        redirect_to root_path

      else # passwords don't match

        # redirect flash error
        flash[:login_error] =  "Account information incorrect"
        redirect_to session_username_path, method: :get

      end

    end

    session[:current_user_id] = params[:id]

  end

  # for logging out
  def destroy

    session[:user_id] = nil # remove session

    redirect_to root_path, notice: "Logged Out"

  end

end