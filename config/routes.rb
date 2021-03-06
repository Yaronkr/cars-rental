Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :cars do
    resources :bookings, only: [:new,:create]
    collection do
      get :my_cars
    end
  end

  resources :bookings, only: [:update, :destroy] do
    collection do
      get :my_bookings
      get :car_bookings
    end
  end

end
