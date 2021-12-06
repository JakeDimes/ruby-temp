class TasksController < ApplicationController
  def new
    @task = Task.new
    #@user_tasks = Task.find_by_team_id(session[:current_user_team])
  end

  def delete_task

    # get the team ID
    name = params[:id]

    # get the team object and delete it
    Task.find(name).delete

    # redirect
    redirect_to tasks_new_url


  end

  def create_task
    #params from form submission
    tasks_data = params[:task]

    #task = Task.new name:tasks_data[:name], team_id:tasks_data[:team_id], due_date:tasks_data[:due_date]
    task = Task.new
    task.name = tasks_data[:name]
    task.team_id = tasks_data[:team_id]
    task.due_date = tasks_data[:due_date]
    # TODO: check .save for success
    task.eval_id = Task.count + 1

    task.save

    # wip
    redirect_to url: tasks_path, method: :get
  end
end
