class AddLocalNameToTeams < ActiveRecord::Migration
  def up
    remove_column :teams, :name
    add_column :teams, :name_en, :string
    add_column :teams, :name_ru, :string
  end

  def down
    remove_column :teams, :name_en
    remove_column :teams, :name_ru
    add_column :teams, :name, :string
  end
end
