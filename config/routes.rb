Rails.application.routes.draw do
	scope '/JPweb-be', defaults: {format: :json} do

		# shallow: true
		resources :books do
			get '/units', to:'books#units'
			get '(/:unit)/vocabs', to:'vocabs#index'
			get '(/:unit)/grammars', to:'grammars#index'
			resources :vocabs, only: [:index]
			resources :grammars, only: [:index]
			get '/minitest(/:size)(/:type)(/:time)', to: 'books#minitest'
		end

		get '/u/last', to: 'users#last'
		resources :users do
			resources :scores, only: [:index, :create, :delete]
			resources :books, only: [:index, :create]	
		end

		get	'/auth/google_oauth2' ,to: redirect('/auth/google_oauth2')
	end

	get '/auth/:provider/callback', to: 'users#google', defaults: {format: :json} 
	get '/auth/failure', to: redirect('/'), defaults: {format: :json} 
end

