Rails.application.routes.draw do
  resources :competitions do
    collection do 
      get "search"
    end
    member do
      post "remove_tag", as: "remove_tag_from"
      post "add_tag", as: "add_tag_to"
    end
  end
  resources :competition_tags
  get "/about", to: "competitions#about"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "competitions#index"
end
