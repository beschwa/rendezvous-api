class User < ApplicationRecord

	validates :username, uniqueness: { case_sensitive: false }
	has_secure_password

	has_many :owned_events, class_name: 'Event'

	has_many :followers, class_name: 'Follow', foreign_key: :followed_id
	has_many :fans, through: :followers, source: :follower

	has_many :followed, class_name: 'Follow', foreign_key: :follower_id
	has_many :favorites, through: :followed, source: :followed


	has_many :attendings, class_name: 'Attendee'
	has_many :events, through: :attendings

	has_many :likes
	has_many :tags, through: :likes
	
end
