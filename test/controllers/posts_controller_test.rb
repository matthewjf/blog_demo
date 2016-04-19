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

require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  def setup
    @post = posts(:orange)
  end

  test "should redirect create when not admin" do
    assert_no_difference 'Post.count' do
      post :create, micropost: { title: "Lorem ipsum"}
    end
    assert_redirected_to root_url
  end

  test "should redirect destroy when not admin" do
    assert_no_difference 'Post.count' do
      delete :destroy, id: @post
    end
    assert_redirected_to root_url
  end
end
