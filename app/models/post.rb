class Post < ActiveRecord::Base
  belongs_to :user
  has_many :sections

  accepts_nested_attributes_for :sections, allow_destroy: true, reject_if: :all_blank

  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title, presence: true
  validates :sections, presence: true
end
