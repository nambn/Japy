class BooksController < ApplicationController

	# GET /books
	# GET /users/:user_id/books
	def index
		@books = params[:user_id].present? ? (User.find(params[:user_id]).books) : Book.all
		render json: {"result" => true,"data" => @books}
	end

	# POST /books
	def create
		@book = Book.new(book_params)
		if @book.save
			render json: {"result" => true,"data" => @book}
		else
			render json: {"result" => false, "data" => @book.errors}
		end
	end

	# GET /books/:book_id/units
	def units
		@units = Vocab.where(book_id: params[:book_id]).select("unit").distinct
		data = []
		@units.each do |unit|
			data << {"Bai": unit}
		end
		render json: {"result" => true,"data" => @units}
	end

	# PATCH/PUT /books/:id
	def update
		@book = Book.find(params[:id])
		if @book.update_attributes(book_params)
			render json: {"result" => true,"data" => @book}
		else
			render json: {"result" => false, "data" => @book.errors}
		end
	end

	# DELETE /books/:book_id
	def delete
		Book.find(params[:id]).destroy
		render json: {"result" => true}
	end

	# GET /minitest
	def minitest
		size = params[:size] == "null" ? 10 : params[:size].to_i
		type = params[:type] == "null" ? 1 : params[:type].to_i
		time = params[:time] == "null" ? false : params[:time]
		@total = []
		@rd = []
		for i in 0..size
			@total.push(Vocab.where(book_id: params[:book_id]).all.shuffle[0..3])
			@rd.push(Random.rand(0..3))
		end
		render json: {"result" => true,"data" => @total, "random" => @rd }
	end

	private
	def book_params
		params.require(:book).permit(:title, :level, :price, :cover_image, :description)
	end
end