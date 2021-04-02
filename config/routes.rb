Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # get 'home/index'
  # get 'misc/index'
  
  root 'posts#index'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get '/posts/:id', to: 'posts#show', as: 'show_post'
  get '/posts', to: 'posts#index', as: 'list_posts'
  get '/posts/new', to: 'posts#new', as: 'new_post'
  get '/posts/edit', to: 'posts#edit', as: 'edit_post'
  get '/users/new', to: 'users#new', as: 'new_user'
  get '/users/:username', to: 'users#show', as: 'show_user'
  get '/users', to: 'users#index', as: 'list_users'
  get '/users/edit', to: 'users#edit', as: 'edit_user'
  #get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create', as: "login_user"
  get 'logout', to: 'sessions#destroy', as: 'logout'
  resource 'users'
  resource 'posts'
end