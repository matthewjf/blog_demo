# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text
#  user_id    :integer
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CommentsController < ApplicationController
  before_action :logged_in_user, only: :create
  before_action :post_published, only: :create

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
  end


  private
    def comment_params
      params.require(:comment).permit(:body)
    end

    def post_published
      post = Post.find(params[:post_id])
      unless post.published
        flash[:error] = "Publish the post before adding comments"
        redirect_to post
      end
    end
end
