class UsersController < ApplicationController
	before_action :logged_in_user, only: [:index, :show, :edit, :update]
	before_action :correct_user, only: [:edit, :update]

	# GET /users
	# GET /users.json
	def index
		respond_to do |format|
			format.html {
				@users = User.paginate(page: params[:page], :per_page => 10)
			}
			format.json {
				@users = User.all
			}
		end
	end

	# GET /users/1
	# GET /users/1.json
	def show
		@user = User.find(params[:id])
	end

	# GET /users/new
	def new
		if logged_in?
			flash[:msg] = '*** Already logged in ***'
			redirect_to current_user
		end
		@user = User.new
	end

	# POST /users
	# POST /users.json
	def create
		@user = User.new(user_params)
		respond_to do |format|
			if @user.save
				log_in @user
				format.html { 
					flash[:msg] = '*** User was successfully created. ***'
					redirect_to @user
				}
				format.json { render :show, status: :created, location: @user }
			else
				format.html { render :new }
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
	end

	# GET /users/1/edit
	def edit
		@user = User.find(params[:id])
	end

	# PATCH/PUT /users/1
	# PATCH/PUT /users/1.json
	def update
		@user = User.find(params[:id])
		respond_to do |format|
			if @user.update_attributes(user_params)
				format.html { 
					flash[:msg] = '*** User was successfully updated. ***'
					redirect_to @user
				}
				format.json { render :show, status: :ok, location: @user }
			else
				format.html { render :edit }
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end
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
end
