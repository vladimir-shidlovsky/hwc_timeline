class Event < ActiveRecord::Base
  scope :with_tags, ->(tags) {where "'{?}' @> tag_ids", tags}

  def tag_ids=(tags)
    tag_ids_will_change!
    super Array(tags)
  end

  def to_s
    "Событие #{title} (#{date.to_s})"
  end
end
