class AttendeeSerializer < ActiveModel::Serializer
	attributes :id, :event_id

	belongs_to :user, serializer: AttendingSerializer
end
