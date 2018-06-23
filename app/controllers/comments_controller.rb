class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end
  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:post_id]
    @comment.user_id = current_user.id
    @comment.save
    redirect_to post_path(params[:post_id])
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
