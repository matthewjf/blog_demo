class CreateStaticPages < ActiveRecord::Migration
  def change
    create_table :static_pages do |t|
      t.text :content
      t.string :name

      t.timestamps null: false
    end
  end
end
