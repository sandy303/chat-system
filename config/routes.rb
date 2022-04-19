Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  resources :conversations do
    resources :messages
  end

  # Defines the root path route ("/")
  root "convesrations#index"
end
