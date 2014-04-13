class AddTagsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :tag_ids, :integer, array: true, null: false, default: []
    add_index  :events, :tag_ids, using: :gin
  end
end
