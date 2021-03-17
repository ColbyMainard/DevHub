Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'home/index'
  get 'misc/index'
  get '/posts/:id', to: 'posts#show', as: 'show_post'
  get '/posts', to: 'posts#index', as: 'list_posts'
  get '/posts/new', to: 'posts#new', as: 'new_post'
  get '/posts/edit', to: 'posts#edit', as: 'edit_post'
  get '/users/:id', to: 'users#show', as: 'show_user'
  get '/users', to: 'users#index', as: 'list_users'
  get '/users/new', to: 'users#new', as: 'new_user'
  get '/users/edit', to: 'users#edit', as: 'edit_user'
end
