class UsersController < ApplicationController
	before_action :authenticate_user!, only:[:index,:show,:edit]
	def top
	end

	def new
	end

	def about
	end

	def create
		@user = User.new(user_params)
		if @user.save
		  redirect_to users_path
		else
			render :show
		end
	end

	def index
		@users = User.all
		@book = Book.new
	end

	def show
		@user = User.find(params[:id])
	    @book = Book.new
	    @books = @user.books
	end

	def edit
		@user = User.find(params[:id])
		if @user.id != current_user.id
			redirect_to user_path(current_user.id)
		end
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
		  flash[:notice] = "You have update user successfully."
		  redirect_to user_path
		else
			render :edit
		end
	end
	private

	def user_params
		params.require(:user).permit(:name,:introduction,:profile_image)
	end
end
