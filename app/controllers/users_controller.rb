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
		@user = User.new(user_params)
		respond_to do |format|
			if @user.save
				format.json { render json: {"result" => true,"data" => @user}}
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
				format.json { render json: {"result" => true,"data" => @user}}
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

	# GET /auth/google_oauth2
	def google
		g = request.env['omniauth.auth'].to_hash
		if ( user = User.find_by(email: g["info"]["email"]) )
			if ( user.oauth_token == g["uid"] )
				respond_to do |format|
					format.json { render json: {"result" => true, "data" => user}}
				end
			else
				respond_to do |format|
					format.json { render json: {"result" => false, "data" => {"errors" => "This email has been used"}}}
				end
			end
		else
			@user = User.new ({
				name: g["info"]["name"],
				email: g["info"]["email"],
				password: g["uid"],
				password_confirmation: g["uid"],
				oauth_token: g["uid"],
				img_url: g["info"]["image"] })
			respond_to do |format|
				if @user.save
					format.json { render json: {"result" => true,"data" => @user}}
				else
					format.json { render json: {"result" => false, "data" => @user.errors}}
				end
			end
		end
	end

	private
	# Never trust parameters from the scary internet, only allow the white list through.
	def user_params
		params.require(:user).permit(:name, :email, :img_url, :password, :password_confirmation)
	end
end
