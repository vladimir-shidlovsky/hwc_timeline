class AddFavouriteTagsToUser < ActiveRecord::Migration
  def change
    add_column :users, :favourite_tags, :integer, array: true, null: false, default: []
    add_index  :users, :favourite_tags, using: :gin
  end
end
