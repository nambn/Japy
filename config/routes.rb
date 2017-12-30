Rails.application.routes.draw do
	scope '/JPweb-be' do
		root 'japy#home'

		resources :books, shallow: true do
			get '/units', to:'books#units'
			get '(/:unit)/vocabs', to:'vocabs#index'
			get '(/:unit)/grammars', to:'grammars#index'
			resources :vocabs
			resources :grammars
			get '/minitest(/:size)(/:type)(/:time)', to: 'books#minitest'
		end

		get    '/signup'    ,to: 'users#new'
		post   '/signup'    ,to: 'users#create'
		resources :users do
			resources :scores
		end

		get    '/login'     ,to: 'sessions#new'
		post   '/login'     ,to: 'sessions#create'
		delete '/logout'    ,to: 'sessions#destroy'

		# namespace :admin do
		# 	resources :users
		# 	resources :vocabs
		# 	resources :grammars
		# 	resources :books
		# end
	end
end