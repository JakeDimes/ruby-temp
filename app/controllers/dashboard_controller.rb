class DashboardController < ApplicationController
  def admin
    @account = Account.new
  end

  def student
  end


  # DELETE request to dashboard - Deletes user accounts
  def delete_account

    print(params)

    # get the user id passed in from the parameters
    account_id = params[:id]

    # delete from database
    Account.find(account_id).delete

    # render admin
    render 'dashboard/admin'

  end


  # POST request to dashboard - Adds users to Accounts database
  def add_account

    # params from the route form submission

    # :account gets account related data from the params
    account_data = params[:account]

    # create a new account
    @account = Account.new fname: account_data[:fname], lname: account_data[:lname], dotnum: account_data[:dotnum]

    # save to database
    # TODO: check .save for success
    @account.save

    @account = Account.new
    # render the form page again
    render 'admin'
  end
end
