class EventFollower < ApplicationRecord
  belongs_to :event, class_name: "Event"
  belongs_to :follower, class_name: "User"
  validates :event_id, presence: true
  validates :follower_id, presence: true
end
