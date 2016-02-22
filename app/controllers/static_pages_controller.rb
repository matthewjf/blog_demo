class StaticPagesController < ApplicationController
  def home
    @posts = Post.paginate(page: params[:page])
  end

  def about
  end

  def contact
  end
end
