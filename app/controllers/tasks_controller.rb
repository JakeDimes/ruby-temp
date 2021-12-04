class TasksController < ApplicationController
  def main

  end

  def delete_task

    # get the team ID
    name = params[:id]

    # get the team object and delete it
    Tasks.find(name).delete

    # redirect
    redirect_to dashboard_admin_tasks_path


  end
end
