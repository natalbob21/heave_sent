Rails.application.routes.draw do
  devise_for :users, :controllers => {resgistrations: 'resgistrations'}
  resources :events
  root "static#home"

  resource :calendar, only: [:show]
end
