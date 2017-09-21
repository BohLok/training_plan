Rails.application.routes.draw do
  # get 'users/index'

  # get 'users/new'

  # get 'users/edit'

  # get 'users/show'

  get 'homepage/index'

  # resources :training

  devise_for :users, :path => 'accounts'

  # devise_for :users, controllers: {
  #       sessions: 'users/sessions'
  #     }


  resources :users do
    resources :training
    get 't_plan/show_month'
    get 't_plan/show_week'
  end

  
  get 'homepage/index' => "homepage#index", :as => 'index'
  root to: "homepage#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
