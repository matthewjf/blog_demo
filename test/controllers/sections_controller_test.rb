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

class SectionsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
end
