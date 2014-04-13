class AddTagsToGames < ActiveRecord::Migration
  def change
    add_column :games, :tag_ids, :integer, array: true, null: false, default: []
    add_index  :games, :tag_ids, using: :gin
  end
end
