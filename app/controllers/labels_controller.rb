class LabelsController < ApplicationController
  before_action :admin_user, except: [:index, :show]

  def index
  end

  def show
    @label = Label.find(params[:id])
    @posts = @label.posts.paginate(page: params[:page])
  end

  def destroy
  end
end
