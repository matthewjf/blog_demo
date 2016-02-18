class PostsController < ApplicationController
  before_action :admin_user, except: [:index, :show]
  before_action :logged_in_user, except: [:index, :show]

  def index
    @posts = Post.paginate(page: params[:page])
  end

  def show
    @post = Post.find(params[:id])
    @sections = @post.sections
  end

  def new
    @post = Post.new
    @post.sections.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created"
      redirect_to @post
    else
      render 'new'
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
      params.require(:post).permit(:title, sections_attributes: [:id, :body, :_destroy])
    end
end
