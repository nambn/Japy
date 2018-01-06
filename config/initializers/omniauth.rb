OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
	provider :google_oauth2, "558025580195-63m15fm5l695tffig7vk6m43uu0govu1.apps.googleusercontent.com", 'YWpt-aiMUM3RRPvIAMOWRpLP'	

	provider :facebook, "791412961066935", '6f0c25f12bd091c244742e4800a6e34b'
end
