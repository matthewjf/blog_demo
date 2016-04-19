# == Schema Information
#
# Table name: labelings
#
#  id         :integer          not null, primary key
#  label_id   :integer
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class LabelingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
