class LabelsController < ApplicationController
  before_action :admin_only, except: [:index, :show]

  def index
    @labels = Label.all
  end

  def show
    @label = Label.find(params[:id])
    @posts = @label.posts.where("published_at IS NOT NULL").paginate(page: params[:page])
  end

  def destroy
    Label.find(params[:id]).destroy
    flash[:success] = "Label deleted"
    redirect_to labels_url
  end

  def edit
    @label = Label.find(params[:id])
  end

  def update
    @label = Label.find(params[:id])
    if @label.update_attributes(label_params)
      flash[:success] = "Label updated"
      redirect_to labels_url
    else
      render 'edit'
    end
  end

  private
    def label_params
      params.require(:label).permit(:name)
    end
end
