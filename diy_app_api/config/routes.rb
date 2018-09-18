Rails.application.routes.draw do
  scope module: :api, defaults: { format: :json }, path: 'api' do
    scope module: :v1 do
      devise_for :users do
        # resources :sessions, only: [:create, :destroy]
        get 'login' => 'sessions#new'
        get 'logout' => 'sessions#destroy'
      end
    #   devise_for :users, controllers: {
    #     registrations: 'api/v1/users/registrations',
    #     sessions: [:create, :destroy]
    #   }, skip: [:password]
    end
  end
  ## Start routing for oauth callbacks
  # get 'users/auth/:provider/callback', to: "sessions#create", as: "sign_in"
  # delete '/sign_out', to: "sessions#destroy", as: "sign_out"
  ## End routing for oauth callbacks, to "sessions#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
