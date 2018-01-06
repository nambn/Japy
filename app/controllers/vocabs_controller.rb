class VocabsController < ApplicationController

	# GET /books/:book_id/vocabs
	# GET /books/:book_id/:unit/vocabs
	# GET /users/:user_id/vocabs
	def index
		if params[:user_id]
			@vocabs = User.find(params[:user_id]).vocabs
		else
			@vocabs = Vocab.where(book_id: params[:book_id])
			@vocabs = @vocabs.where(unit: params[:unit]) if params[:unit].present?
		end
		render json: {"result" => true, "data" => @vocabs}
	end

	# GET /vocabs/:id
	def show
		@vocab = Vocab.find(params[:id])
		render json: {"result" => true, "data" => [@vocab]}
	end
	
	# POST /books/:book_id/vocabs
	def create

	end
	
	# UPDATE /books/:book_id/vocabs
	# DELETE /books/:book_id/vocabs

end
