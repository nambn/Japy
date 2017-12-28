module UsersHelper

  # Returns the Gravatar for the given user.
  def gravatar_for(user, options = { size: 80 })
  	gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
  	size = options[:size]
  	gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
  	image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  # Confirms a logged-in user.
  def logged_in_user
  	unless logged_in?
  		store_location
  		flash[:msg] = '*** Login first ***'
  		redirect_to login_url
  	end
  end
end