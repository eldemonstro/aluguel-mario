Rails.application.routes.draw do
  devise_for :owners
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  resources :properties , only: [:index, :new , :show, :create] do

    resources :proposals, only: [:show, :new, :create] do
      post 'accept', on: :member
    end
    resources :season_rates, only: [:show, :new, :create]
    resources :unavailable_dates, only: [:show, :new, :create]

    get 'search_by_type', on: :collection
    get 'search_by_location', on: :collection
  end
end
