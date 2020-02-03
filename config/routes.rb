Rails.application.routes.draw do
  devise_for :users
  root "declarations#index"
  resources :declarations do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    collection do
      get "score"
    end
  end
end
