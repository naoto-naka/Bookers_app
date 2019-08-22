class BooksController < ApplicationController
	before_action :authenticate_user!, only:[:index,:show,:edit]
	def new
	end
	def create
		@books = Book.all
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
		  flash[:notice] = "You have created book successfully"
		  redirect_to book_path(@book.id)
		else
			render "books/index"
		end
	end
	def show
		@book = Book.find(params[:id])
		@user = @book.user
	end
	def index
		@books = Book.all
		@book = Book.new
		@user = User.new
	end
	def destroy
		book = Book.find(params[:id])
		book.destroy
		redirect_to books_path
	end
	def edit
		@book = Book.find(params[:id])
		if @book.id != current_user.id
			redirect_to books_path
		end
	end
	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
		  flash[:notice] = "You have update book successfully"
		  redirect_to book_path(@book.id)
		else
			render :edit
		end
	end

	private
	def book_params
		params.require(:book).permit(:title,:body)
	end
end
