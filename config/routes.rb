Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      get '/revenue', to: "merchant/revenue#index"
      get 'merchants/most_revenue', to: "merchant/most_revenue#index"
      get 'merchants/most_items', to: "merchant/most_items#index"
      get 'merchants/find', to: 'merchant/find#show'
      get 'items/find', to: 'items/find#show'
      get 'merchants/find_all', to: 'merchant/find#index'
      get 'items/find_all', to: 'items/find#index'

      resources :items, only: [:index, :show, :create, :update, :destroy]
      resources :merchants, only: [:index, :show, :create, :update, :destroy] do
        resources :items, only: [:index], controller: 'merchant/items'
      end

      resources :items, only: [] do
        resources :merchant, only: [:index], controller: 'items/merchant'
      end

    end
  end
end
