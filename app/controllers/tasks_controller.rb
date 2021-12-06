class TasksController < ApplicationController
  def new
    @task = Task.new
    @user_tasks = Task.find_by_team_id(session[:current_user_team])
  end

  def delete_task

    # get the team ID
    name = params[:id]

    # get the team object and delete it
    Tasks.find(name).delete

    # redirect
    redirect_to tasks_new_url


  end

  def create_task
    #params from form submission
    tasks_data = params[:task]

    @task = Task.new name:tasks_data[:name], team_id:tasks_data[:team_id], due_date:tasks_data[:due_date], status:tasks_data[:status]
    # TODO: check .save for success
    @task.save

    @task = Task.new
    # wip
    redirect_to tasks_new_url
  end
end
