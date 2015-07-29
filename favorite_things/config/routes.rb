Rails.application.routes.draw do

  resources :users do
    resources :items, only: [:index]
    get '/users/:user_id/categories/:id', to: 'users#items_by_category', as: 'items_by_category'
    # resources :categories, only: [:show], controller: 'users'
  end

  resources :categories do
    resources :items, only: [:index]
  end

  resources :items

end
