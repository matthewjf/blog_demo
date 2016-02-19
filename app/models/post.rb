class Post < ActiveRecord::Base
  belongs_to :user
  has_many :sections, dependent: :destroy
  has_many :labelings, dependent: :destroy
  has_many :labels, through: :labelings

  accepts_nested_attributes_for :sections, allow_destroy: true, reject_if: :all_blank

  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title, presence: true
  validates :sections, presence: true

  def label_list
    labels.join(", ")
  end

  def label_list=(labels_string)
    label_names = labels_string.split(",").collect{|s| s.strip.downcase}.uniq
    new_or_found_labels = label_names.collect { |name| Label.find_or_create_by(name: name) }
    self.labels = new_or_found_labels
  end
end
