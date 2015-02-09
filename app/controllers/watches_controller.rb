class WatchesController < ApplicationController

before_action :authenticate_user!

  def create
    project = Project.friendly.find params[:project_id]
    watch = project.watches.new
    watch.user = current_user
    watch.save
    redirect_to project, notice: "Project added to watched list"
  end

  def destroy
    project = Project.friendly.find params[:project_id]
    watch = project.watches.find params[:id]
    if watch.destroy
      redirect_to project, notice: "Unwatched"
    end
  end

end
