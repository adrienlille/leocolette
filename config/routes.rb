Rails.application.routes.draw do
  root to: 'pages#home'
  get 'setaccount', to: 'pages#setaccount'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :profiles, only: [:show, :update] do
    collection do                       # collection => no restaurant id in URL
      get 'edit', to: "profiles#edit"  # RestaurantsController#top
      post 'edit', to: 'profiles#create'
      patch ':id', to: 'profiles#setaccount'
    end
  end

  resources :apartments do
    collection do                       # collection => no restaurant id in URL
        get 'mine', to: "apartments#mine"  # RestaurantsController#mine
    end
    resource :bookings, only: [:create, :new, :show, :update]
  end
end
