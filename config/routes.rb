Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # get 'home/index'
  # get 'misc/index'
  resource 'users'
  resource 'posts'
  root 'posts#index'
  get '/posts', to: 'posts#index', as: 'list_posts'
  get '/posts/new', to: 'posts#new', as: 'new_post'
  get '/posts/:id', to: 'posts#show', as: 'show_post'
  get '/posts/:id/edit', to: 'posts#edit', as: 'edit_post'
  patch '/posts/:id', to: 'posts#update', as: 'update_post'
  put '/posts/:id/edit', to: 'posts#update', as: 'updated_post'
  get '/users/new', to: 'users#new', as: 'new_user'
  get '/users/:id', to: 'users#show', as: 'show_user'
  get '/users', to: 'users#index', as: 'list_users'
  get '/users/edit', to: 'users#edit', as: 'edit_user'
  get 'login', to: 'sessions#new'
  resources :sessions, only: [:new, :create, :destroy]
  
  get 'login', to: 'sessions#new', as: 'log_in' #https://levelup.gitconnected.com/simple-authentication-guide-with-ruby-on-rails-16a6255f0be8
  post 'login', to: 'sessions#create' #https://levelup.gitconnected.com/simple-authentication-guide-with-ruby-on-rails-16a6255f0be8
  get 'signup', to: 'users#new', as: 'signup'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end