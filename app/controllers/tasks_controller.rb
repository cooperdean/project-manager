class TasksController < ApplicationController

before_action :authenticate_user!

def create
  @project = Project.friendly.find params[:project_id]
    @task = Task.new task_params
    @task.project = @project
    @task.user = current_user
    TaskMailer.notify_project_owner(@task).deliver
    @task.save
    if @task.save
      redirect_to @project, notice: "Task Added!"
    else
      redirect_to @project, notice: "Task empty..."
    end
end

def update
  @task = Task.find(params[:id])
  @task.user = current_user
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
    task.update_attribute(:completion,true)
  else
    task.update_attribute(:completion,false)
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
