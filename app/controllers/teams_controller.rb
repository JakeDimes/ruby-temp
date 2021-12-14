class TeamsController < ApplicationController

  # method is in the ApplicationController
  before_action :check_user_auth

  # GET to teams. Renders the list of all teams
  def main
    # renders the main page
  end

  # GET to teams/new. Renders a form for adding a customizable number of teammates
  def add_team
    # renders add team
    @num = 0 # for the number of users the admin wants to add to the team
    @team = Team.new # for the form_with model
  end

  # POST to teams/new/num. Update the number of teams in the form and re-renders the add team page
  def change_num
    # get num user entered
    @num = params[:num].to_i

    # check that num isn't neagative, 0, or too large to crash the server
    if @num > 0 && @num < 501  # check that parameter is an integer

      # set num
      @num = params[:num]
      flash[:error] = nil

    elsif @num >= 501
      flash[:error] = "#{@num} students is too many to add to a single team!"
      @num = 0
    else
      flash[:error] = 'Must enter an integer greater than 0 for number of students!'
      @num = 0
    end
    @team = Team.new
    render :add_team
  end

  # Delete Request to: teams/delete/:id. Destroy team with :id
  def delete_team

    # get the team ID
    team_id = params[:id]

    # find all accounts with these team ids and reset them
    accounts = Account.where(team_id: team_id)

    # for each account, update the team_id to be 0 (not in a team)
    accounts.each do |acc| # while account is not null

      acc.update team_id: 0

    end

    # get the team object and delete it
    Team.find(team_id).destroy

    # redirect
    redirect_to teams_path


  end

  # POST to user/teams/new: user is creating a new team
  def save_team

    # new team object
    @team = Team.new

    # get the id of the last team in the table (team with the highest ID), and adjust it for the new team object
    last_team = Team.last

    # if a last team exists
    if last_team
      @team.id = Team.last.id + 1
    else
      @team.id = 1
    end


    @team.count = 0
    @team.name = params[:team_name]

    # get the number of teammates the user wishes to add
    num = params[:num]

    # for each teammate to add
    num.to_i.times do |i|

      # memX will be an Account ID
      key = "mem#{i}"

      # point the account to their new team
      # cannot be an admin
      if params[key].to_i > 1

        account = Account.find_by id: params[key].to_i

        # if the account could be found if account
        if account
          account.update team_id: @team.id
          @team.count+=1
        end
      end
    end

    # if validations passed
    if @team.save
      redirect_to teams_path
    else
      # undo all the accounts team_ids
      num.to_i.times do |i|

        # memX will be an Account ID
        key = "mem#{i}"

        # point the account to their new team
        # cannot be an admin
        if params[key].to_i > 1

          account = Account.find_by id: params[key].to_i

          # if the account could be found if account
          if account
            account.update team_id: 0
          end
        end
      end

      @num = 0
      render :add_team
    end
  end

end
