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

class Labeling < ActiveRecord::Base
  belongs_to :label
  belongs_to :post
end
