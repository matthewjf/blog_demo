# == Schema Information
#
# Table name: sections
#
#  id              :integer          not null, primary key
#  body            :text
#  post_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  title           :string
#  picture         :string
#  picture_caption :string
#

require 'test_helper'

class SectionTest < ActiveSupport::TestCase
  def setup
    @user = users(:rails)
    @post = @user.posts.new(title: "Dolor")
    @section = @post.sections.new(body: "Lorem ipsum")
  end

  test "body should be present" do
    @section.body = "    "
    assert_not @section.valid?
  end
end
