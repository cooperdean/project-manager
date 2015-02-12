class TasksController < ApplicationController

before_action :authenticate_user!

def create
  @project = Project.friendly.find params[:project_id]
    @task = Task.new task_params
    @task.project = @project
    @task.user = current_user
    @task.save
    respond_to do |format|
    if @task.save
        format.html { redirect_to @project, notice: "Task saved" }
        format.js   { render }
      else
        format.html { render "projects/show" }
        format.js   { render }
    end
  end
end

def update
  @task = Task.find(params[:id])
  @task.user = current_user
  # TaskMailer.notify_project_owner(@task).deliver
  if @task.update_attribute(:completion, params[:completion])
    redirect_to @task.project
  end
end

def destroy
    @project = Project.friendly.find(params[:project_id])
    @task.destroy
    redirect_to @project
end

def toggle_task
  @project = Project.friendly.find(params[:project_id])
  if @task.completion == false
    task.update_attribute(:completion, true)
  else
    task.update_attribute(:completion, false)
  end
  @task.user = current_user
  if @task.update
    redirect_to @project
  end
end

private

def task_params
  params.require(:task).permit(:description, :completion)
end

end
