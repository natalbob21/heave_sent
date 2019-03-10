Rails.application.routes.draw do
  devise_for :users
  resources :events
  root "events#index"
  get "/:page" => "static#show"
end
