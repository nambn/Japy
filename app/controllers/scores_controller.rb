class ScoresController < ApplicationController
	before_action :logged_in_user

	def index
		@user = User.find(params[:user_id])
	end
end
