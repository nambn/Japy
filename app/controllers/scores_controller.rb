class ScoresController < ApplicationController
	before_action :logged_in_user

	def index
		@scores = Score.where(user_id: params[:user_id])
	end
end
