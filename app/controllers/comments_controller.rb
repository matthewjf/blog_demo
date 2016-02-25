class CommentsController < ApplicationController
  before_action :logged_in_user, only: :create

  def index
    @post = Post.find(params[:post_id])
    redirect_to @post
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "Comment added"
      redirect_to @post
    else
      @sections = @post.sections
      @comments = @post.comments.paginate(page: params[:page])
      render 'posts/show' # todo: autoscroll to comment form
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post.comments.find(params[:id]).destroy
    flash[:success] = "Comment deleted"
    redirect_to root_url
  end


  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
