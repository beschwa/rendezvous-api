class Event < ApplicationRecord

	validates :name, :size, :description, :location, :when, presence: true
	validates :size, numericality: {greater_than_or_equal_to: 1}

	belongs_to :user

	has_many :attendees
	has_many :users, through: :attendees

	has_many :eventtags
	has_many :tags, through: :eventtags

	def space_left
		self.size - self.users.length 
	end

end