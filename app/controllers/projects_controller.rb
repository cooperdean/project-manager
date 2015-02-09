class ProjectsController < ApplicationController
  before_action :find_project, 
                  only: [:show, :edit, :update, :destroy]

  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @projects = Project.all
  end

  def show
    @project = Project.friendly.find params[:id]
    @project.increment!(:view_count)
    @task =  Task.new
    @comment = Comment.new
  end

  def add_contributors
    @project = Project.find params[:id]
  end

  def new
    @project = current_user.projects.build
  end

  def edit
  end

  def create
    @project = current_user.projects.build(project_params)
    @project.view_count = 0
      if @project.save
        redirect_to @project, notice: 'Project was successfully created.'
      else
        render :new
      end
    end

  def update
   @project.update project_params
      if @project.update(project_params)
       redirect_to @project, notice: 'Project was successfully updated.'
      else
        render :edit
      end
    end

  def destroy
    @project.destroy
    redirect_to projects_url, notice: 'Project was successfully destroyed.'
    end

  private

    def find_project
      @project = Project.friendly.find params[:id]
    end
  
    def set_project
      @project = Project.friendly.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:title, :description, :start_date, :due_date, {contributor_ids: []})
    end
end
