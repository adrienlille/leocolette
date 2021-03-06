Rails.application.routes.draw do
  root to: 'pages#home'
  get 'setaccount', to: 'profiles#setaccount', as: :setaccount
  post 'setaccount', to: 'profiles#saveaccounttype'
  get 'about', to: 'pages#about'
  get 'search', to: 'pages#search', as: :search


  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :profiles, only: [:show, :update] do
    collection do                       # collection => no restaurant id in URL
      get 'edit', to: "profiles#edit"  # RestaurantsController#top
      post ':id', to: 'profiles#create'
    end
  end

  resources :apartments do
    collection do                       # collection => no restaurant id in URL
        get 'mine', to: "apartments#mine"  # RestaurantsController#mine
    end
    resource :bookings, only: [:create, :new, :show, :update]
    resources :reviews
  end

  resources :bookings, only: [:index, :update]

  resources :conversations do
    resources :messages
  end

  resources :orders, only: [:show, :create] do
    resources :payments, only: [:new, :create]
  end

end
