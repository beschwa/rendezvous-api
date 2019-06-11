class EventSerializer < ActiveModel::Serializer

	attributes :id, :owner, :name, :description, :image_url, :relevant_url, :size


	has_many :users, key: :people

	def owner
		{id: "#{self.object.user.id}", name: self.object.user.username}
	end
end

