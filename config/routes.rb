Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	resources :events do
		resources :posts
	end

	resources :users do
		resources :events
		resources :posts
	end

	resources :event_followers do
	end

	resources :posts do
	end

	get '/events/:event_id/followers' => 'event_followers#get_followers'
	get 'users/:user_id/joined_event' => 'event_followers#get_joined_events'

	get '/login' => 'users#login'
end
