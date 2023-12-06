Rails.application.routes.draw do
  devise_for :users, controllers:{
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  namespace :api, defaults: { format: :json } do
    namespace :v1 do        
      resources :orders

      resources :products
    end
  end
end
