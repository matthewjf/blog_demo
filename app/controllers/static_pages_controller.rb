class StaticPagesController < ApplicationController
  def home
    @posts = Post.get_published.paginate(page: params[:page])
  end

  def about
  end

  def contact
  end
end
