class Tag < ApplicationRecord

	has_many :likes
	has_many :users, through: :likes

	has_many :eventtags
	has_many :events, through: :eventtags

end
