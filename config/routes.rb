Rails.application.routes.draw do
	scope '/JPweb-be', defaults: {format: :json} do
		resources :books, shallow: true do
			get '/units', to:'books#units'
			get '(/:unit)/vocabs', to:'vocabs#index'
			get '(/:unit)/grammars', to:'grammars#index'
			resources :vocabs
			resources :grammars
			get '/minitest(/:size)(/:type)(/:time)', to: 'books#minitest'
		end

		get '/signup', to: 'users#new'
		resources :users do
			resources :scores
			resources :books, only: :index
		end

		get '/login', to: 'sessions#new'
		post '/login', to: 'sessions#create'
		delete '/logout', to: 'sessions#destroy'
	end
end