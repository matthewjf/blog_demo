require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @user = users(:rails)
    @post = @user.posts.new(title: "Dolor")
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
