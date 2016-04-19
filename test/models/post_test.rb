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

class PostTest < ActiveSupport::TestCase
  def setup
    @user = users(:rails)
    @post = @user.posts.new(title: "Dolor", body: "lorem")
    @section = @post.sections.new(body: "Ipsum")
  end

  test "should be valid" do
    assert @post.valid?
  end

  test "user id should be present" do
    @post.user_id = nil
    assert_not @post.valid?
  end

  test "title should be present" do
    @post.title = nil
    assert_not @post.valid?
  end

  test "order should be most recent first" do
    assert_equal posts(:most_recent), Post.first
  end

end
