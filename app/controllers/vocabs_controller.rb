class VocabsController < ApplicationController
	before_action :set_book

	# GET /books/:book_id/:unit/vocabs.json
	def index
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

	private
	def set_book
		@vocabs = Vocab.where(book_id: params[:book_id])
	end
end
