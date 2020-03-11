Rails.application.routes.draw do
	resources :layouts
	resources :users, only: [:create]
	resources :sessions, only: [:create]
	resources :dashboard
	get 'layouts/landing' #receives incoming request for layouts.ladning
	root'layouts#landing' #the root page will be layouts.;admgon
	post '/sessions' => 'sessions#create'
	post '/users' => 'users#create'
	get '/login' => 'layouts#login'
	get '/register' => 'layouts#register'
	get '/dashboard' => 'dashboard#index'
	#pre_dashboard true false represent the pre_dashboard page for tutors and students
	get '/pre_dashboardfalse' => 'dashboard#pre_index'
	get '/pre_dashboardtrue' => 'dashboard#pre_index_tutor'
	post '/dashboard_update_bio' => 'dashboard#update_bio'
	post '/dashboard_update_bio_subjects' => 'dashboard#update_bio_subjects'
	 get 'logout', to: 'sessions#destroy', as: 'logout'  

end
