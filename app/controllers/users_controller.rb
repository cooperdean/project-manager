class UsersController < ApplicationController
  def show
      @user = User.find params[:id]
      @projects = Project.all
      @contributors = @user.contributed_projects
      @watches = @user.watched_projects
  end
end
