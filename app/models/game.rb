class Game < ActiveRecord::Base
  belongs_to :team_1, class_name: 'Team'
  belongs_to :team_2, class_name: 'Team'

  validates :team_1, presence: true
  validates :team_1, presence: true

  scope :featured, -> { where('date >= ?', Time.zone.now - 1.hour) }
  scope :recent, -> { where('date < ?', Time.zone.now - 1.hour) }
end
