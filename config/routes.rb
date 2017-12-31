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

		resources :users, only: [:index, :show] do
			resources :scores, only: [:index, :create, :delete]
			resources :books, only: [:index, :create]
		end

		# get '/login', to: 'sessions#new'
		# post '/login', to: 'sessions#create'
		# delete '/logout', to: 'sessions#destroy'
	end
end