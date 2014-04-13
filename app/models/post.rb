class Post < ActiveRecord::Base
  belongs_to :user

  has_one :post_image

  validates :message, presence: true, allow_blank: false

  def tag_ids=(tags)
    tag_ids_will_change!
    super Array(tags)
  end
end
