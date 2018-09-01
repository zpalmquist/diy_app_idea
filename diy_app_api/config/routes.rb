Rails.application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout" },
                     controllers: {omniauth_callbacks: "omniauth_callbacks"}



  ## Start routing for oauth callbacks

  # get 'users/auth/:provider/callback', to: "sessions#create", as: "sign_in"

  # delete '/sign_out', to: "sessions#destroy", as: "sign_out"

  ## End routing for oauth callbacks, to "sessions#create"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
