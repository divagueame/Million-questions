Rails.application.routes.draw do
  get 'reports', to: "reports#index", as: 'reports'
  
  get 'home', to: 'home#index', as: 'home'
  get 'game', to: 'game#index', as: 'game'
  delete 'game', to: "game#destroy"
  get 'finish', to: 'game#finish', as: 'finish'

  get 'game/report', to: 'game#report'
  get 'scoreboard', to: 'scoreboard#index'

  resources :questions do
    resources :answers
  end

  devise_for :users
  root 'home#index'
end
