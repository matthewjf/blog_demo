class RemovePublishedFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :published, :boolean
  end
end
