Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create] #signup
      post "/login", to: "sessions#login"
      get "/autologin", to: "sessions#autologin"
      resources :boards, only: [:index, :create, :destroy]
      resources :pins, only: [:index, :show, :create, :destroy]
    end
  end
end
