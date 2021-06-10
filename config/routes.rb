Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create] #signup
      post "/login", to: "sessions#login"
      get "/autologin", to: "sessions#autologin"
      resources :boards, only: [:index, :create]
      resources :pins, only: [:index, :show, :create]
    end
  end
end
