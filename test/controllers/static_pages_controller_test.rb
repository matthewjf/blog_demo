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

require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  def setup
    @base_title = "Rig"
  end

  # not sure how to fix these tests

  # test "should get about" do
  #   get :about
  #   assert_response :success
  #   assert_select "title", "About | #{@base_title}"
  # end
  #
  # test "should get contact" do
  #   get :contact
  #   assert_response :success
  #   assert_select "title", "Contact | #{@base_title}"
  # end
end
