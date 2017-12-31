class UsersController < ApplicationController
	# before_action :logged_in_user, only: [:index, :show, :edit, :update]
	# before_action :correct_user, only: [:edit, :update]
	# before_action :admin_user, only: :destroy

	# GET /users
	def index
		@users = User.all
	end

	# GET /users/:id
	def show
		@user = User.find(params[:id])
	end

	# POST /users
	def create
		@user = User.new(user_params)
		respond_to do |format|
			if @user.save
				log_in @user
				format.json { render json: {"result" => "true","data" => @user.to_json}}
			else
				format.json { render json: {"result" => "false", "data" => @user.errors}}
			end
		end
	end

	# PATCH/PUT /users/:id
	def update
		@user = User.find(params[:id])
		respond_to do |format|
			if @user.update_attributes(user_params)
				format.json { render json: {"result" => "true","data" => @user.to_json}}
			else
				format.json { render json: {"result" => "false", "data" => @user.errors}}
			end
		end
	end

	# DELETE /users/:id
	def destroy
		User.find(params[:id]).destroy
		respond_to do |format|
			format.json { render json: {"result" => "true"}}
		end
	end

	private
	# Never trust parameters from the scary internet, only allow the white list through.
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

	# Confirm the correct user
	def correct_user
		@user = User.find(params[:id])
		redirect_to(current_user) unless current_user?(@user)
	end

	# Confirms an admin user.
	def admin_user
		redirect_to(root_url) unless current_user.admin?
	end
end
