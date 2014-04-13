class Team < ActiveRecord::Base
  def name
    read_attribute "name_#{ I18n.locale }"
  end
end
