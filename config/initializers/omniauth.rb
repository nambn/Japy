OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
	provider :google_oauth2, "558025580195-63m15fm5l695tffig7vk6m43uu0govu1.apps.googleusercontent.com", "YWpt-aiMUM3RRPvIAMOWRpLP"

	provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']

end
