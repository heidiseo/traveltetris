Rails.application.routes.draw do
  devise_for :users
  root to: 'plans#new'
  resources :bookings, only: [:index, :traveller_info]

  resources :plans do
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :flights, only: [:index, :show] do
      collection do
        get 'api'
      end
    end
  end
end
