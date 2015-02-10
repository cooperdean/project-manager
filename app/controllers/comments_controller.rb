class CommentsController < ApplicationController

before_action :authenticate_user!

def create
  @project = Project.friendly.find params[:project_id]
    @comment = Comment.new comment_params
    @comment.project = @project
    @comment.user = current_user
    @comment.save
    respond_to do |format|
    if @comment.save
        format.html { redirect_to @project, notice: "comment saved" }
        format.js   { render }
      else
        format.html { render "projects/show" }
        format.js   { render }
    end
  end
end

def destroy
    @project = Project.friendly.find(params[:project_id])
    @comment.destroy
    redirect_to @project
end

private

def comment_params
  params.require(:comment).permit(:body)
end

end
