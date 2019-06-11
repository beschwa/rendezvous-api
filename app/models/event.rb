class Event < ApplicationRecord
	belongs_to :user

	has_many :attendees
	has_many :users, through: :attendees

	has_many :eventtags
	has_many :tags, through: :eventtags
end
