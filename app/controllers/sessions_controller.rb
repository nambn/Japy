class SessionsController < ApplicationController
	def new
		if logged_in?
			flash[:msg] = "*** Already logged in ***"
			redirect_to current_user
		end
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			log_in user
			params[:session][:remember_me] == '1' ? remember(user) : forget(user)
			flash[:msg] = "Logged in successfully!"
			redirect_back_or user
		else
			flash.now[:msg] = 'Invalid email/password combination'
			render 'new'
		end
	end

	def destroy
		log_out if logged_in?
		redirect_to login_path
	end
end
