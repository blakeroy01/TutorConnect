Rails.application.routes.draw do
	root :to => 'users#landing'
	get '/' => 'users#landing'
	post '/sessions' => 'sessions#create'
	post '/users' => 'users#create'
	get '/dashboard' => 'dashboard#index'
	get '/login', to: 'users#login'
	get '/register', to: 'users#register'

end
