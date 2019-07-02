class Api::V1::AttendeesController < ApplicationController
	skip_before_action :authorized, only: [ :index, :show]


	def index
		attendees = Attendee.all
		render json: attendees
	end

	def create
		attendee = Attendee.create(event_id: params[:event_id], user_id: params[:user_id])
		render json: attendee
	end

	def destroy
		# byebug
		Attendee.find_by(user_id: params[:user_id], event_id: params[:event_id]).destroy
		event = Event.find(params[:event_id])
		render json: event
	end
end
