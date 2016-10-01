Rails.application.routes.draw do
  namespace :api do
    resources :satoshi_pays, only: [ :index ]
    resources :postbanks, only: [ :index ]
  end
end
