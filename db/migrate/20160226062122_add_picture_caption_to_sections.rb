class AddPictureCaptionToSections < ActiveRecord::Migration
  def change
    add_column :sections, :picture_caption, :string
  end
end
