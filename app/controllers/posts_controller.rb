class PostsController < ApplicationController
  before_action :admin_user, except: [:index, :show]
  before_action :logged_in_user, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update]

  def index
    @posts = Post.paginate(page: params[:page])
  end

  def show
    @post = Post.find(params[:id])
    @sections = @post.sections
    @comments = @post.comments.paginate(page: params[:page])
    @comment = @post.comments.build
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created"
      redirect_to post_path(@post, :anchor => "comments")
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

  private
    def post_params
      params.require(:post).permit(:title, :body, :picture, :label_list,
            sections_attributes: [:id, :title, :body, :picture, :_destroy])
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end
end
