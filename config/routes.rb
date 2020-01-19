Rails.application.routes.draw do
  root "declarations#index"
  resources :declarations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
