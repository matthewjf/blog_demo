class CommentsController < ApplicationController
  before_action :logged_in_user, only: :create

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "Comment added"
      redirect_to @post
    else
      # not sure how to get error messages here
      render @post
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
