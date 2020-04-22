Rails.application.routes.draw do
	resources :layouts
	resources :users
	resources :sessions, only: [:create, :destroy]
	resources :dashboard
	get 'layouts/landing' #receives incoming request for layouts.ladning
	#root 'layouts#show'
	root'layouts#landing' #the root page will be layouts.;admgon
	post '/sessions' => 'sessions#create'
	post '/users' => 'users#create'
	get '/login' => 'layouts#login'
	get '/register' => 'layouts#register'
	get '/dashboard' => 'dashboard#index'
	#edit_profile true false represents the edit profile page for tutors and students
	get '/pre_dashboardfalse' => 'dashboard#pre_index'
	get '/pre_dashboardtrue' => 'dashboard#pre_index_tutor'
	get '/edit_profilefalse' => 'users#edit'
	get '/edit_profiletrue' => 'users#edit_tutor'
	#pre_dashboard true false represent the pre_dashboard page for tutors and students
	post '/dashboard_update_bio' => 'dashboard#update_bio'
	post '/dashboard_update_bio_subjects' => 'dashboard#update_bio_subjects'
	get 'logout', to: 'sessions#destroy', as: 'logout'
	post 'create_message' => 'messages#create'
	 get 'logout', to: 'sessions#destroy', as: 'logout'  
	get '/settings' => 'layouts#settings'
	get '/tutors' => 'layouts#index'
	get '/delete' => 'users#destroy'

end
