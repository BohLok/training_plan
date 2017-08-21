Rails.application.routes.draw do
  get 'homepage/index'

  # resources :training

  devise_for :users, :path => 'accounts'

  resources :users do
    resources :training
    get 't_plan/show'
  end

  
  get 'homepage/index' => "homepage#index", :as => 'index'
  root to: "homepage#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
