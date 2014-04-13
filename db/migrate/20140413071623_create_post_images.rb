class CreatePostImages < ActiveRecord::Migration
  def change
    create_table :post_images do |t|
      t.string :image
      t.references :post

      t.timestamps
    end
  end
end
