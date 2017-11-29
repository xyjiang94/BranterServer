class User < ApplicationRecord
	has_many :events

	has_many :event_followers, foreign_key: "follower_id", dependent: :destroy
	has_many :joined_events, through: :event_followers, source: :event

	has_many :posts

	validates_presence_of :name
end
