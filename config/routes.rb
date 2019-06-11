Rails.application.routes.draw do

	namespace :api do
		namespace :v1 do
			post '/login', to: 'auth#create'
			resources :users, only: [:index, :show, :create, :update]
			resources :events, only: [:index, :show, :create, :update]
		end
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
