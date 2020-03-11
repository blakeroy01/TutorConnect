Rails.application.routes.draw do
	resources :layouts
	resources :users, only: [:create]
	resources :sessions, only: [:create]
	get 'layouts/landing' #receives incoming request for layouts.ladning
	root'layouts#landing' #the root page will be layouts.;admgon
	post '/sessions' => 'sessions#create'
	post '/users' => 'users#create'
	get '/login', to: 'layouts#login'
	get '/register', to: 'layouts#register'
	get '/dashboard' => 'dashboard#index'

end
