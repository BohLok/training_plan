Rails.application.routes.draw do
  resources :training

  devise_for :users
  get 't_plan/show'

  root to: "t_plan#show"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
