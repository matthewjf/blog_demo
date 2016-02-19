class CommentsController < ApplicationController
  before_action :logged_in_user, only: :create

  def index
    @post = Post.find(params[:post_id])
    redirect_to @post
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "Comment added"
      redirect_to @post
    else
      flash[:danger] = "Comment can't be empty"
      redirect_to @post
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
