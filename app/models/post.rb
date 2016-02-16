class Post < ActiveRecord::Base
  belongs_to :user
  has_many :sections
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title, presence: true
end