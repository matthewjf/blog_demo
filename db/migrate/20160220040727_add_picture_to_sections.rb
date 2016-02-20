class AddPictureToSections < ActiveRecord::Migration
  def change
    add_column :sections, :picture, :string
  end
end
