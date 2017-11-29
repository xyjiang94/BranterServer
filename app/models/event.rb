class Event < ApplicationRecord

	belongs_to :user

	has_many :event_followers, foreign_key: "event_id", dependent: :destroy
	has_many :followers, through: :event_followers, source: :follower

	has_many :posts
	
	validates_presence_of :title
end
