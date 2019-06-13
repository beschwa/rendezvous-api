class Api::V1::AuthController < ApplicationController

	skip_before_action :authorized, only: [:create]

	def create
		user = User.find_by(username: user_login_params[:username])

		if user && user.authenticate(user_login_params[:password])
			token = encode_token({user_id: user.id})
			render json: {user: UserSerializer.new(user),  jwt: token}, status: :accepted
		else
			render json: {message: 'Invalid username or password'}, status: :unauthorized
		end
	end

	def auto_login
		token = auth_header.split(' ')[1]
		user_id = JWT.decode(token, 'my_s3cr3t', true, algorithm: 'HS256')[0]["user_id"]
		user = User.find(user_id)
		render json: {user: UserSerializer.new(user)}
	end


	private

	def user_login_params
		params.require(:user).permit(:username, :password)
	end
end
