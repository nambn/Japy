class ScoresController < ApplicationController

	# GET /users/:user_id/scores
	def index
		@scores = Score.where(user_id: params[:user_id])
		render json: {"result" => true,"data" => @scores}
	end

	# POST /users/:user_id/scores
	def create
		@score = Score.new(score_params)
		@score.user_id = params[:user_id]
		if @score.save
			render json: {"result" => true, "data" => @score}}
		else
			render json: {"result" => false, "data" => @score.errors}}
		end		
	end

	# DELETE /users/:user_id/scores/:id
	def delete
		Score.find(params[:id]).destroy
		render json: {"result" => true}}
	end

	private
	def score_params
		params.require(:data).permit(:value)
	end
end
