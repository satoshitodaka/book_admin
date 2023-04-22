Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :publishers
  resources :books, only: %i[show destroy]
  resource :profile, only: %i[show edit update]
end
