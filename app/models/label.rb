class Label < ActiveRecord::Base
  has_many :labelings
  has_many :posts, through: :labelings

  validates :name, presence: true

  def to_s
    name
  end
end
