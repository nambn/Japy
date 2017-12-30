class BooksController < ApplicationController

	# GET /books
	# GET /users/:user_id/books
	def index
		@books = params[:user_id].present? ? (User.find(params[:user_id]).books) : Book.all
	end

	# GET /books/:book_id/units.json
	def units
		@units = Vocab.where(book_id: params[:book_id]).distinct.pluck(:unit)
	end

	def minitest(size = 10, type = 1, time = false)
		@total = []
		@rd = []
		for i in 0..size
			@total.push(Vocab.where(book_id: params[:book_id]).all.shuffle[0..3])
			@rd.push(Random.rand(0..3))
		end
	end
end