Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :properties , only: [:new , :show, :create] do
    resources :proposals, only:[:show, :new, :create]
  end
end
