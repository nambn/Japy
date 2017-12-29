class BooksController < ApplicationController

	# GET /books.json
	def index
		@books = Book.all
	end

	# GET /books/:book_id/units.json
	def units
		@units = Vocab.where(book_id: params[:book_id]).distinct.pluck(:unit)
	end
end