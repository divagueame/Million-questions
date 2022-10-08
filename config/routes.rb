Rails.application.routes.draw do
  get 'home', to: 'home#index', as: 'home'
  get 'game', to: 'game#index', as: 'game'
  get 'scoreboard', to: 'scoreboard#index'

  resources :questions do
    resources :answers 
  end
  
  devise_for :users
  root 'home#index'
end
