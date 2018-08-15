Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, :controllers => { registrations: 'registrations' }

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :apartments do
    collection do                       # collection => no restaurant id in URL
        get 'mine', to: "apartments#mine"  # RestaurantsController#mine
    end

    resource :bookings, only: [:create, :new, :show, :update]
  end
end
