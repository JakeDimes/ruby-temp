class SessionController < ApplicationController

  # GET to: session/login -> renders login form
  def user_name_form

    # check if their exists an admin (Account with ID 1)

    unless Account.exists?(1) # no account exists

      redirect_to session_admin_path, method: :get

    end # render if an admin exists

    # renders enter user name form

  end

  # GET to: session/admin -> form for creating an admin account
  def create_admin_account # called when no admin account exists on login

    # for the form with model
    @account = Account.new

    # render form
  end

  # POST to: session/admin -> save admin account
  def save_admin_account # called when no admin account exists on login

    # for the form with model
    @account = Account.new

    # account data
    acc_data = params[:account]

    #save the account
    @account.id = 1
    @account.fname = acc_data[:fname]
    @account.lname = acc_data[:lname]
    @account.dotnum = acc_data[:dotnum]
    @account.email = acc_data[:email]
    @account.password = acc_data[:password]
    @account.password_confirmation = acc_data[:password_confirmation]


    # save it
    if @account.save

      # send back to home
      redirect_to root_path
    else

      render :create_admin_account

    end
  end


  # GET to: session/password -> login password form
  def password_form

    # get the user's email
    # @ so email can be sent to the password view
    @email = params[:entered_uname]

    # check if this user has a passowrd
    account = Account.find_by(email: @email)
    if account.present? # account exists

      if account.password_digest.eql? "" # no password set

        # get their id
        id = account.id
        # redirect to update password
        redirect_to session_setpassword_path(:email => @email, :id => id), method: :get

      end

    end

    # renders enter password form

  end

  # GET request to open the session -> session/auth
  def create

    # get the login information
    email = params[:email]
    password = params[:entered_pswd]

    # validate the information
    account = Account.find_by(email: email)

    if account.nil? # no user with that email exists

      # redirect flash error
      flash[:login_error] = "Account information incorrect"
      redirect_to session_login_path, method: :get

    else  # a user with that email exists

      if account.authenticate(password) # passwords match

        # open the session
        session[:user_id] = account.id
        flash[:login_error] = nil
        # redirect to home
        redirect_to root_path

      else # passwords don't match

        # redirect flash error
        flash[:login_error] =  "Account information incorrect"
        redirect_to session_login_path, method: :get

      end
    end
  end

  # PUT to: session/logout -> for logging out
  def destroy

    session[:user_id] = nil # remove session

    redirect_to root_path, notice: "Logged Out"

  end

end