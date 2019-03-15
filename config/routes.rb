Rails.application.routes.draw do
  devise_for :users, :controllers => {resgistrations: 'resgistrations'}
  resources :events
  root "events#index"
  get "/:page" => "static#show"

  resource :calendar, only: [:show]
end
