class Event < ActiveRecord::Base
  def tag_ids=(tags)
    tag_ids_will_change!
    super Array(tags)
  end
end
