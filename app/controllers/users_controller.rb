class UsersController < ApplicationController

	# GET /users
	def index
		@users = User.all
		render json: {"result" => true, "data" => @users}
	end

	# GET /users/:id
	def show
		@user = User.find(params[:id])
		render json: {"result" => true, "data" => @user}
	end

	# POST /users
	def create
		@user = User.new(user_params)
		if @user.save
			render json: {"result" => true,"data" => @user}
		else
			render json: {"result" => false, "data" => @user.errors}
		end
	end

	# PATCH/PUT /users/:id
	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			render json: {"result" => true,"data" => @user}
		else
			render json: {"result" => false, "data" => @user.errors}
		end
	end

	# DELETE /users/:id
	def destroy
		User.find(params[:id]).destroy
		render json: {"result" => true}
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
				render json: {"result" => true, "data" => user}
			else
				render json: {"result" => false, "data" => {"errors" => "This email has been used"}}
			end
		else
			@user = User.new ({
				name: g["info"]["name"],
				email: g["info"]["email"],
				password: g["uid"],
				password_confirmation: g["uid"],
				oauth_token: g["uid"],
				img_url: g["info"]["image"] })
			if @user.save
				render json: {"result" => true,"data" => @user}
			else
				render json: {"result" => false, "data" => @user.errors}
			end
		end
	end
	
	# GET /auth/facebook
	def facebook
		f = request.env['omniauth.auth'].to_hash
		if ( user = User.find_by(email: f["info"]["email"]) )
			if ( user.oauth_token == f["uid"] )
				render json: {"result" => true, "data" => user}
			else
				render json: {"result" => false, "data" => {"errors" => "This email has been used"}}
			end
		end
	else
		@user = User.new ({
			name: f["info"]["name"],
			email: f["info"]["email"],
			password: f["uid"],
			password_confirmation: f["uid"],
			oauth_token: f["uid"],
			img_url: f["info"]["image"] })		
		if @user.save
			render json: {"result" => true,"data" => @user}
		else
			render json: {"result" => false, "data" => @user.errors}
		end
	end

	# POST /login
	def login
		debugger
		@user = User.find_by(name: params[:username])
		if @user && @user.authenticate(params[:password])
			render json: {"result" => true, "data" => @user}
		else
			render json: {"result" => false, "data" => 'Invalid email/password combination'}
		end	
	end

	private
	# Never trust parameters from the scary internet, only allow the white list through.
	def user_params
		params.require(:user).permit(:name, :email, :img_url, :password, :password_confirmation)
	end
end
