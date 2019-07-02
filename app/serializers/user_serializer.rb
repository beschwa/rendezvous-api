class UserSerializer < ActiveModel::Serializer
	attributes :id, :username, :display_name, :full_name, :email, :tagline, :bio, :birthday, :location, :occupation, :avatar, :gender, :orientation, :relationship_status, :romantic_preference, :event_info

	def event_info
		x = self.object.owned_events.map do |event|
			event.id
		end

		y = self.object.events.map do |event|
			event.id
		end
		# byebug
		{owned: x, attending: y}
	end

end