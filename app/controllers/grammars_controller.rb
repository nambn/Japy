class GrammarsController < ApplicationController

	# GET /books/:book_id/grammars
	# GET /books/:book_id/:unit/grammars
	# GET /users/:user_id/grammars
	def index
		if params[:user_id]
			@grammars = User.find(params[:user_id]).grammars
		else
			@grammars = Grammar.where(book_id: params[:book_id])
			@grammars = @grammars.where(unit: params[:unit]) if params[:unit].present?
		end
		render json: {"result" => true, "data" => @grammars}
	end

	# GET /grammars/:id
	def show
		@grammar = Grammar.find(params[:id])
		render json: {"result" => true, "data" => @grammar}
	end
	
	# POST /books/:book_id/grammars
	def create

	end
	
	# UPDATE /books/:book_id/grammars
	# DELETE /books/:book_id/grammars


end
