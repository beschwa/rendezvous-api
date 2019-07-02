class EventSerializer < ActiveModel::Serializer

	attributes :id, :owner, :name, :description, :image_url, :location, :relevant_url, :size, :space_left


	has_many :users, serializer: AttendingSerializer, key: :attending


	def owner
		{id: self.object.user.id, name: self.object.user.username}
	end
end

