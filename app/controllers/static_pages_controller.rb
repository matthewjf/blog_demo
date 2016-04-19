# == Schema Information
#
# Table name: static_pages
#
#  id         :integer          not null, primary key
#  content    :text
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class StaticPagesController < ApplicationController
  before_action :admin_only, only: [:edit, :update]

  def show
    @page ||= StaticPage.find(params[:id])
  end

  def about
    @page = StaticPage.find_by(name: "About")
    render 'show'
  end

  def contact
    @page = StaticPage.find_by(name: "Contact")
    render 'show'
  end

  def edit
    @page = StaticPage.find(params[:id])
  end

  def update
    @page = StaticPage.find(params[:id])
    if @page.update_attributes(page_params)
      flash[:success] = "Page updated"
      redirect_to @page
    else
      render 'edit'
    end
  end

  private
    def page_params
      params.require(:static_page).permit(:content)
    end
end
