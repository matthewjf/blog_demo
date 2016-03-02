class Post < ActiveRecord::Base
  belongs_to :user
  has_many :sections, dependent: :destroy
  has_many :labelings, dependent: :destroy
  has_many :labels, through: :labelings
  has_many :comments, dependent: :destroy

  mount_uploader :picture, PictureUploader

  accepts_nested_attributes_for :sections, allow_destroy: true, reject_if: :all_blank

  scope :get_published, -> { where("published_at IS NOT NULL") }
  scope :get_unpublished, -> { where(published_at: nil) }
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title, presence: true
  validates :body, presence: true

  self.per_page = 8

  def label_list
    labels.join(", ")
  end

  def label_list=(labels_string)
    label_names = labels_string.split(",").collect{|s| s.strip.downcase}.uniq
    new_or_found_labels = label_names.collect { |name| Label.find_or_create_by(name: name) }
    self.labels = new_or_found_labels
  end

  def published
    self.published_at.nil? ? false : true
  end

  def published?
    self.published_at.nil? ? false : true
  end
end
