class Api::V1::EventsController < ApplicationController

	skip_before_action :authorized, only: [:index, :show]
	before_action :find_event, only: [:update]

	def index
		events = Event.all
		render json: events
	end

	def show
		event = Event.find(params[:id])
		render json: event
	end

	def create
		event = Event.create(event_params)
		byebug
		if event.valid?
			render json: {event: event}, status: :created
		else
			render json: {error: event.errors}
		end
	end

	def update
		@event.update(update_params)
		render json: {event: @event}
	end


	private

	def find_event
		@event = Event.find(params[:id])
	end

	def event_params
		params.require(:event).permit(:user_id, :name, :description, :size, :location, :when, :image_url, :relevant_url)
	end

	def update_params
		params.require(:event).permit(:name, :description, :size, :location, :when, :image_url, :relevant_url)
	end

	
end
