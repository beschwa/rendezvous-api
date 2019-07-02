Rails.application.routes.draw do

	namespace :api do
		namespace :v1 do
			get '/auto_login', to: 'auth#auto_login'
			get '/resources', to: 'events#resources'

			post '/login', to: 'auth#create'

			delete '/attendees', to: 'attendees#destroy'
			resources :users, only: [:index, :show, :create, :update]
			resources :events, only: [:index, :show, :create, :update]
			resources :attendees, only: [:index, :create, :destroy]
		end
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
