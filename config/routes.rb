Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users
  devise_for :owners

  resources :properties, only: [:index, :new , :show, :create] do
    resources :proposals, only: [:show, :new, :create] do
      post 'accept', on: :member
    end
    resources :season_rates, only: [:show, :new, :create]
    resources :unavailable_dates, only: [:show, :new, :create]

    get 'search_by_type', on: :collection
    get 'search_by_location', on: :collection
  end

  get 'my_proposals', to: 'proposals#index', as: 'my_proposals'
end
