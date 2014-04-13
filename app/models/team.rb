class Team < ActiveRecord::Base
  scope :with_tags, ->(tags) {where "'{?}' @> tag_ids", tags}

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

  def to_s
    "Команда #{name}"
  end
end
