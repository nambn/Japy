class ApplicationController < ActionController::Base
	protect_from_forgery with: :null_session # :exception
	include SessionsHelper
	include UsersHelper
end
