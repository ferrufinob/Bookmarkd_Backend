Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create] #signup
      # post login sessions controller
      resources :boards, only: [:index, :show]
      resources :pins, only: [:index, :show, :create, :edit]
    end
  end
end
