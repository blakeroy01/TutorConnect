Rails.application.routes.draw do 
	resources :layouts
	get 'layouts/landing' #receives incoming request for layouts.ladning
	root'layouts#landing' #the root page will be layouts.;admgon 	

	get '/login', to: 'layouts#login' 
	get '/register', to: 'layouts#register'
	get '/login/register', to: 'layouts#register'
	
end 