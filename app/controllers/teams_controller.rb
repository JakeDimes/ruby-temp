class TeamsController < ApplicationController

  before_action :check_user_auth

  def check_user_auth

    if Current.user # a user is signed in

      if !(Current.user.id == 1) # user isnt an admin

        flash[:error] = "You must be an admin to access that page"
        redirect_to root_path
      else
        flash[:error] = nil
        @navbar_buttons = {Accounts: account_path, Teams: teams_path, Tasks: tasks_path}
      end

    else # a user isnt signed in

      flash[:error] = "You must sign in"

      redirect_to root_path

    end

  end

  def main
    # renders the main page

  end

  def add_team
    # renders add team
    @num = 0
    @team = Team.new
  end

  def change_num
    @num = params[:num].to_i
    if @num > 0  # check that parameter is an integer
      @num = params[:num]
      flash[:error] = nil
    else
      flash[:error] = 'Must enter an integer greater than 0 for number of students!'
    end
    @team = Team.new
    render :add_team
  end

  def delete_team

    # get the team ID
    team_id = params[:id]

    # find all accounts with these team ids and reset them
    account = Account.find_by(team_id: team_id)

    while account # while account is not null

      account.team_id = 0
      account.save
      account = Account.find_by(team_id: team_id)

    end

    # get the team object and delete it
    Team.find(team_id).delete

    # redirect
    redirect_to teams_path


  end

  # Post request: user is creating a new team
  def save_team

    # new team object
    @team = Team.new
    @team.count = 1
    @team.name = "Temp"

    # save it to create an id
    @team.save

    #bring it back in
    @team = Team.order("created_at").last
    @team.count = 0
    @team.name = nil

    @team.name = params[:team_name]

    # get the parameters
    num = params[:num]

    num.to_i.times do |i|

      # get the key
      key = "mem#{i}"
      puts key

      # point the account to their new team
      if params[key].to_i > 1

        account1 = Account.find params[key].to_i
        account1.team_id = @team.id
        account1.save
        @team.count+=1

      end

    end

    if @team.save
      redirect_to teams_path
    else
      @num = 0
      render :add_team
    end
  end

end
