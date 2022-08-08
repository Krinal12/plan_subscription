Rails.application.routes.draw do
  get 'visitor/index'
  get 'subscriptions/upgrade'

  resources :plans do
    resources :subscriptions
    get 'switch_plans'
  end

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "plans#index"
  # Defines the root path route ("/")
  # root "articles#index"

end
