class AddPictureCaptionToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :picture_caption, :string
  end
end
