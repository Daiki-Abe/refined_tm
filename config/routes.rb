Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # この記述がないと、ルーティングエラーになる。具体的には[GET]メソッドを参照してしまう。 

  root "declarations#index"
  resources :declarations do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    collection do
      get "score"
    end
  end
end
