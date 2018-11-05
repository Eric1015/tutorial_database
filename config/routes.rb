Rails.application.routes.draw do
  root "pages#index"
  resources :cars, only: [:index, :show]
  resources :engines, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
