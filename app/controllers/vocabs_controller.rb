class VocabsController < ApplicationController
	# before_action :buy_book

	# GET /books/:book_id/:unit/vocabs.json
	def index
		@vocabs = Vocab.where(book_id: params[:book_id])
		@vocabs = @vocabs.where(unit: params[:unit]) if params[:unit].present?
		respond_to do |format|
			format.html{@vocabs = @vocabs.paginate(:page => params[:page], :per_page => 10)}
			format.json{@vocabs}
		end
	end

	# GET /vocabs/:id.json
	def show
		@vocab = Vocab.find(params[:id])
	end

	# private
	# # Confirm current user owns the book
	# def buy_book
	# 	current_book =  params[:book_id] ? Book.find(params[:book_id]) : Vocab.find(params[:id]).book
	# 	unless current_book.id == 9
	# 		if !logged_in?
	# 			logged_in_user
	# 		elsif !current_user.books.exists?(current_book.id)
	# 			flash[:msg] = "*** Book not owned ***"
	# 			redirect_to current_user
	# 		end
	# 	end
	# end
end
