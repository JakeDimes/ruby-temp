class TeamsController < ApplicationController

  def main
    # renders the main page


  end

  def add_team

  end

  def delete_team

    # get the team ID
    team_id = params[:id]

    # get the team object and delete it
    Team.find(team_id).delete

    # redirect
    redirect_to dashboard_admin_teams_path


  end

  # Post request: user is creating a new team
  def save_team

    # new team object
    team = Team.new
    team.count = 0

    # save it to create an id
    team.save

    #bring it back in
    team = Team.order("created_at").last


    # get the parameters
    mem1 = params[:mem1].to_i
    mem2 = params[:mem2].to_i
    mem3 = params[:mem3].to_i
    mem4 = params[:mem4].to_i
    mem5 = params[:mem5].to_i

    # point the accounts to their new team
    if mem1 > 1

      account1 = Account.find mem1
      account1.team_id = team.id
      account1.save
      team.count+=1

    end

    # point the accounts to their new team
    if mem2 > 1

      account2 = Account.find mem2
      account2.team_id = team.id
      account2.save
      team.count+=1

    end

    # point the accounts to their new team
    if mem3 > 1

      account3 = Account.find mem3
      account3.team_id = team.id
      account3.save
      team.count+=1

    end

    # point the accounts to their new team
    if mem4 > 1

      account4 = Account.find mem4
      account4.team_id = team.id
      account4.save
      team.count+=1

    end

    # point the accounts to their new team
    if mem5 > 1

      account5 = Account.find mem5
      account5.team_id = team.id
      account5.save
      team.count+=1

    end

    team.save
    redirect_to dashboard_admin_teams_path

  end

end
