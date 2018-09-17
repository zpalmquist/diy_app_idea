Rails.application.routes.draw do
  scope module: :api, defaults: { format: :json }, path: 'api' do
    scope module: :v1, constraints: ApiConstraint.new(version: 1, default: true) do
      devise_for :users, controllers: {
        registrations: 'api/v1/users/registrations',
      }, skip: [:sessions, :password]
    end
  end



  ## Start routing for oauth callbacks

  # get 'users/auth/:provider/callback', to: "sessions#create", as: "sign_in"

  # delete '/sign_out', to: "sessions#destroy", as: "sign_out"

  ## End routing for oauth callbacks, to "sessions#create"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
