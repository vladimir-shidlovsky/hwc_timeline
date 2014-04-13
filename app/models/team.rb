class Team < ActiveRecord::Base
  def name
    read_attribute "name_#{ I18n.locale }"
  end

  def games
    Game.where("team_1_id = #{ id } OR team_2_id = #{ id }")
  end

  def tag_ids=(tags)
    tag_ids_will_change!
    super Array(tags)
  end
end
