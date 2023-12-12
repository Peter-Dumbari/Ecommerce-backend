Rails.application.routes.draw do
  # Devise routes for user authentication
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # API routes in version 1
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :orders
      resources :order_items
      resources :categories
      resources :product_categories
      resources :products
      resource :cart, only: [:show]
      resources :cart_items, only: [:create, :update, :destroy]
    end
  end
end
