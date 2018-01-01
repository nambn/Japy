class UsersController < ApplicationController

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
		# if :provider
		debugger
		if params[:provider] 
			render(json: params)
		end
		@user = User.new(user_params)
		respond_to do |format|
			if @user.save
				log_in @user
				format.json { render json: {"result" => true,"data" => @user.to_json}}
			else
				format.json { render json: {"result" => false, "data" => @user.errors}}
			end
		end
	end

	# PATCH/PUT /users/:id
	def update
		@user = User.find(params[:id])
		respond_to do |format|
			if @user.update_attributes(user_params)
				format.json { render json: {"result" => true,"data" => @user.to_json}}
			else
				format.json { render json: {"result" => false, "data" => @user.errors}}
			end
		end
	end

	# DELETE /users/:id
	def destroy
		User.find(params[:id]).destroy
		respond_to do |format|
			format.json { render json: {"result" => true}}
		end
	end

	# GET /u/last
	def last
		render json: User.last.id
	end

	private
	# Never trust parameters from the scary internet, only allow the white list through.
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end
end
