class Api::V1::UsersController < ApplicationController

	skip_before_action :authorized, only: [:create, :index, :show]
	before_action :find_user, only: [:update]

	def index
		users = User.all
		render json: users
	end

	def show
		user = User.find(params[:id])
		render json: user
	end

	def profile
		render json: {user: current_user}

	end

	def create
		user = User.create(user_params)
		# byebug
		if user.valid?
			token = encode_token(user_id: user.id)
			render json: {user: UserSerializer.new(user), jwt: token}, status: :created
		else
			render json: {message: user.errors.full_messages}
		end
	end

	def update
		# byebug
		@user.update(update_params)
		render json: {user: @user}
	end

	private

	def find_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:username, :password)
	end

	def update_params
		params.require(:user).permit(:display_name, :full_name, :email, :tagline, :bio, :birthday, :location, :occupation, :avatar, :gender, :orientation, :relationship_status, :romantic_preference)
	end

end
