Rails.application.routes.draw do
  devise_for :users, :controllers => {resgistrations: 'resgistrations'}
  resources :events, :recipients 

  resources :public_events, only: [:show]

  root "static#home"

  resource :calendar, only: [:show]
end
