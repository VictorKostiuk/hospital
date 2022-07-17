Rails.application.routes.draw do
  devise_for :nurses
  devise_for :patients
  resources :patients do
    member do
      patch :update_status
    end
  end
  devise_for :doctors
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "home#index"
end
