class Api::V1::AttendeesController < ApplicationController
	skip_before_action :authorized, only: [:create, :index, :show]


	def index
		attendees = Attendee.all
		render json: attendees
	end
end
