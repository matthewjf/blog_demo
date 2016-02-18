class SectionsController < ApplicationController
  def new
  end

  def create
    # @section = current_user.posts.section.build(section_params)
    # if @section.save
    # else
    #   render 'new'
    # end
  end
  #
  private
    def section_params
  #     params.require(:section).permit(:body)
    end
end
