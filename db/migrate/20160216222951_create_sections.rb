class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.text :body
      t.references :post, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
