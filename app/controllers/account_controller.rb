class AccountController < ApplicationController

  # method is in the ApplicationController
  before_action :check_user_auth

  # renders the index page
  def index
    @account = Account.new
  end

  # DELETE request to dashboard - Deletes user account
  def delete_account

    # get the user id passed in from the parameters
    account_id = params[:id]

    # delete from database
    Account.find(account_id).delete

    # render admin
    redirect_to account_path, method: :post

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
    account_id = params[:id]

    # the new data the user wants to update stuff with
    account_data = params[:account]

    # account object
    @account_to_edit = Account.find_by(id: account_id)

    # update values if account exists
    if @account_to_edit

      @account_to_edit.fname = account_data[:fname]
      @account_to_edit.lname = account_data[:lname]
      @account_to_edit.dotnum = account_data[:dotnum]
      @account_to_edit.email = account_data[:email]
      @account_to_edit.password = account_data[:password]
      @account_to_edit.password_confirmation = account_data[:password_confirmation]

    end

    # save to database
    if @account_to_edit.save
      redirect_to account_path
    else
      render :edit_account
    end

  end


  # POST request to dashboard - Adds users to Accounts database
  def add_account

    # params from the route form submission

    # :account gets account related data from the params
    account_data = params[:account]

    # create a new account
    @account = Account.new
    @account.fname = account_data[:fname] if account_data[:fname]
    @account.lname = account_data[:lname] if account_data[:lname]
    @account.dotnum = account_data[:dotnum] if account_data[:dotnum]
    @account.email = account_data[:email] if account_data[:email]
    @account.team_id = 0
    @account.password = account_data[:password] if account_data[:password]
    @account.password_confirmation = account_data[:password_confirmation] if account_data[:password_confirmation]

    # save to database
    if @account.save
      redirect_to account_path
    else
      render :index
    end
  end
end
