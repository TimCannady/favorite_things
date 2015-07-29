Rails.application.routes.draw do

  get '/login_signup', to: "sessions#login"
  post '/login', to: "sessions#create"
  get '/logout', to: "sessions#destroy"

  resources :users do
    resources :items, only: [:index]
    get '/users/:user_id/categories/:id', to: 'users#items_by_category', as: 'items_by_category'
    # resources :categories, only: [:show], controller: 'users'
  end

  resources :categories do
    resources :items, only: [:index]
  end

  resources :items

  root "users#home"

end
