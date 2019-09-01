class UsersController < ApplicationController
	before_action :set_user, only: [:edit, :update, :show]
	def show

	end

	def edit

	end

	def update

	end

	private
		def set_user
			@user = User.find(params[:id])
		end

		def user_params
			params.require(:user).permit(:email, :username, :firstn_name, :last_name, :gender, :password)
		end
end