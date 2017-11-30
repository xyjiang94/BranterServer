Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


	get '/events/:event_id/followers' => 'event_followers#get_followers'
	get '/users/:user_id/joined_event' => 'event_followers#get_joined_events'

	get '/login' => 'users#login'

	get '/events/:event_id/posts' => 'posts#get_all_by_event'
	get '/users/:user_id/posts' => 'posts#get_all_by_user'

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

end
