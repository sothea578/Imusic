Rails.application.routes.draw do
  root "pages#show", page: "index"

  get "/pages/:page" => "pages#show"

  resources :tracks, only: [:index, :new, :create]
end
