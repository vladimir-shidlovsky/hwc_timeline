class AddTagsToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :tag_ids, :integer, array: true, null: false, default: []
    add_index  :teams, :tag_ids, using: :gin
  end
end
