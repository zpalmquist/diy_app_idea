Rails.application.routes.draw do
  scope module: :api, defaults: { format: :json }, path: 'api' do
    devise_for :users,
      controllers: {
          sessions: "api/users/sessions",
          confirmations: "api/users/confirmations",
          omniauth_callbacks: "api/users/omniauth_callbacks",
          passwords: "api/users/passwords",
          unlocks: "api/users/unlocks",
          registrations: "api/users/registrations"
       }
  end
  ## Start routing for oauth callbacks
  # get 'users/auth/:provider/callback', to: "sessions#create", as: "sign_in"
  # delete '/sign_out', to: "sessions#destroy", as: "sign_out"
  ## End routing for oauth callbacks, to "sessions#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
