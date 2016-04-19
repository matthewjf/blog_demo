# == Schema Information
#
# Table name: labels
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Label < ActiveRecord::Base
  has_many :labelings
  has_many :posts, through: :labelings

  validates :name, presence: true

  def to_s
    name
  end
end
