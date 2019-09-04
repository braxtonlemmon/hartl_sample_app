Rails.application.routes.draw do
	# Static pages
	root   'static_pages#home'
	get    '/help',    to: 'static_pages#help'
	get    '/about',   to: 'static_pages#about'
	get    '/contact', to: 'static_pages#contact'
	
	# Users
	resources :users
	get    '/signup',  to: 'users#new'
	post   '/signup',  to: 'users#create'

	# Sessions
	get    '/login',   to: 'sessions#new'
	post   '/login',   to: 'sessions#create'
	delete '/logout',  to: 'sessions#destroy'

	# Account activations
	resources :account_activations, only: [:edit]
	
	# Password resets 
	resources :password_resets, only: [:new, :create, :edit, :update]
	get 'password_resets/new'
	get 'password_resets/edit'
	
	# Microposts
	resources :microposts, only: [:create, :destroy]
end
