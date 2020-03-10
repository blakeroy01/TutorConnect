Rails.application.routes.draw do
	resources :layouts
	get 'layouts/landing' #receives incoming request for layouts.ladning
	root'layouts#landing' #the root page will be layouts.;admgon
	#post '/sessions' => 'sessions#create'
	#post '/users' => 'users#create'
	get '/dashboard' => 'dashboard#index'
	get '/login', to: 'layouts#login'
	get '/register', to: 'layouts#register'

end
