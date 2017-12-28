Rails.application.routes.draw do
	scope '/JPweb-be' do
		root 'japy#home'

		resources :books do
			resources :vocabs, :grammars
		end

		get    '/signup'             ,to: 'users#new'
		post   '/signup'             ,to: 'users#create'
		resources :users do
			resources :scores
		end

		get    '/login'              ,to: 'sessions#new'
		post   '/login'              ,to: 'sessions#create'
		delete '/logout'             ,to: 'sessions#destroy'

		namespace :admin do
			resources :users, :vocabs, :grammars, :books
		end
	end
end