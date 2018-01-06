Rails.application.routes.draw do
	scope '/JPweb-be', defaults: {format: :json}, except: [:new, :edit] do

		resources :books, shallow: true do
			get '/units', to:'books#units'
			get '(/:unit)/vocabs', to:'vocabs#index'
			get '(/:unit)/grammars', to:'grammars#index'
			resources :vocabs
			resources :grammars
			get '/minitest/:size/:type/:time', to: 'books#minitest'
		end

		post '/login' ,to: 'users#login'
		resources :users do
			resources :scores, only: [:index, :create, :destroy]
			resources :books	
			resources :vocabs
			resources :grammars
		end

		get	'/auth/google_oauth2' ,to: redirect('/auth/google_oauth2')
		get	'/auth/facebook' ,to: redirect('/auth/facebook')

		get '/u/last', to: 'users#last'
	end

	get '/auth/facebook/callback', to: 'users#facebook', defaults: {format: :json} 
	get '/auth/google_oauth2/callback', to: 'users#google', defaults: {format: :json} 
	get '/auth/failure', to: redirect('/'), defaults: {format: :json} 
end

