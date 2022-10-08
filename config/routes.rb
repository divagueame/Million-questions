Rails.application.routes.draw do
  get 'scoreboard', to: 'scoreboard#index'

  resources :questions do
    resources :answers 
  end
  
  devise_for :users
  root 'questions#index'
end
