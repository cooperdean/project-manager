class CommentsController < ApplicationController

before_action :authenticate_user!

def create
  @project = Project.friendly.find params[:project_id]
    @comment = Comment.new comment_params
    @comment.project = @project
    @comment.user = current_user
    @comment.save
    if @comment.save
      redirect_to @project, notice: "Comment Added!"
    else
      redirect_to @project, notice: "Comment body empty..."
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
