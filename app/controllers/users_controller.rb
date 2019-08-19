class UsersController < ApplicationController
	before_action :authenticate_user!, only:[:show,:edit]
	def top
	end

	def new
	end

	def create
		@user = User.new(user_params)
		@user.save
		redirect_to users_path
	end

	def index
	end

	def show
		@user = User.find(params[:id])
		@book = Book.new
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		user = User.find(params[:id])
		if user.update(user_params)
		  redirect_to user_path
		else
			render :show
		end
	end
	private

	def user_params
		params.require(:user).permit(:name,:introduction,:profile_image)
	end

	def book_params
		params.require(:book).permit(:title,:body)
	end
end
