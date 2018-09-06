Rails.application.routes.draw do
  root "static_pages#home"
  devise_for :users
  namespace :admin do
    resources :categories, except: [:index, :show]
  end
  resources :categories, only: [:index, :show]
end
