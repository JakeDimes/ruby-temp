class AccountController < ApplicationController

  before_action :check_user_auth

  def check_user_auth

    if Current.user # a user is signed in

      unless Current.user.id == 1 # user isnt an admin

        flash[:error] = "You must be an admin to access that page"
        redirect_to root_path

      end

    else # a user isnt signed in

      flash[:error] = "You must sign in"

      redirect_to root_path

    end

  end

  # renders the index page
  def index
    @account = Account.new
    @navbar_buttons = {Accounts: account_path, Teams: teams_path}
  end

  # DELETE request to dashboard - Deletes user account
  def delete_account

    # get the user id passed in from the parameters
    account_id = params[:id]

    # delete from database
    Account.find(account_id).delete

    # render admin
    redirect_to account_path

  end

  # GET request to dashboard - edit an account
  def edit_account

    # params from route will be the id
    account_id = params[:id]

    # assign to form_with model
    @account_to_edit = Account.find(account_id)


    # view will generate form_With with account_to_edit model
  end

  # PUT request ot dashboard - save edited account
  def edit_save

    # the account id the user wants to update
    account_id = params[:update_id]

    # the new data the user wants to update stuff with
    account_data = params[:account]

    # account object
    acc_update = Account.find(account_id)

    # update values
    acc_update.fname = account_data[:fname]
    acc_update.lname = account_data[:lname]
    acc_update.dotnum = account_data[:dotnum]
    acc_update.email = account_data[:email]
    acc_update.password = account_data[:password]

    # save to database

    acc_update.save

    redirect_to account_path

  end


  # POST request to dashboard - Adds users to Accounts database
  def add_account

    # params from the route form submission

    # :account gets account related data from the params
    account_data = params[:account]

    # create a new account
    @account = Account.new fname: account_data[:fname], lname: account_data[:lname], dotnum: account_data[:dotnum], email: account_data[:email], password: account_data[:password]

    # save to database
    # TODO: check .save for success
    @account.save


    # render the form page again
    redirect_to account_path
  end
end
