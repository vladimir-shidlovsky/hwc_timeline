class Team < ActiveRecord::Base
  def name
    read_attribute "name_#{ I18n.locale }"
  end

  def tag_ids=(tags)
    tag_ids_will_change!
    super Array(tags)
  end
end
