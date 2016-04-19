# == Schema Information
#
# Table name: posts
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  title           :string
#  picture         :string
#  body            :text
#  picture_caption :string
#  published_at    :datetime
#

class PostsController < ApplicationController
  before_action :admin_only, except: [:index, :show]
  before_action :logged_in_user, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update]

  def index
    @posts = Post.get_published.paginate(page: params[:page]).includes(:labels)
  end

  def pending
    @posts = Post.get_unpublished.paginate(page: params[:page])
  end

  def show
    @post = Post.find(params[:id])
    @sections = @post.sections
    @comments = @post.comments.paginate(page: params[:page])
    @comment = @post.comments.build
    admin_only unless @post.published?
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created"
      redirect_to @post
    else
      render 'posts/new'
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    flash[:success] = "Post deleted"
    redirect_to root_url
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:success] = "Post updated"
      redirect_to @post
    else
      render 'edit'
    end
  end

  def publish
    @post = Post.find(params[:id])
    @post.update_attribute(:published_at, Time.zone.now)
    flash[:success] = "Post published"
    redirect_to @post
  end

  def unpublish
    @post = Post.find(params[:id])
    @post.update_attribute(:published_at, nil)
    flash[:success] = "Post unpublished"
    redirect_to @post
  end

  private
    def post_params
      params.require(:post).permit( :title, :body, :picture, :picture_caption, :label_list,
            sections_attributes: [:id, :title, :body, :picture, :picture_caption, :_destroy])
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end
end
