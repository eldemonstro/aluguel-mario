Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users
  devise_for :owners

  resources :properties, only: [:index, :new , :show, :create] do
    resources :proposals, only: [:show, :new, :create] do
      post 'accept', on: :member
    end

    get 'add_location_purpose', on: :member
    post 'location_purpose', on: :member

    resources :season_rates, only: [:show, :new, :create]
    resources :unavailable_dates, only: [:show, :new, :create]

    get 'search_by_type', on: :collection
    get 'search_by_location', on: :collection
  end

  get 'properties_by_purpose/:id', to: 'location_purposes#index', as: 'properties_by_purpose'

  get 'my_proposals', to: 'proposals#index', as: 'my_proposals'
end
