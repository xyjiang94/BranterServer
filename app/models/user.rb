class User < ApplicationRecord

	has_many :events

	has_many :event_followers, foreign_key: "follower_id", dependent: :destroy
	has_many :joined_events, through: :event_followers, source: :event

	has_many :posts

	before_save { self.email = email.downcase }

	validates :email, presence: true, length: { maximum: 255 },
                    uniqueness: { case_sensitive: false }

	has_secure_password

	attr_accessor :num_events_host, :num_event_joined, :num_post


end
