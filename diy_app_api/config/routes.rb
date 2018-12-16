Rails.application.routes.draw do
  scope module: :api, defaults: { format: :json }, path: 'api' do
    scope :v1 do
      root to: "v1/welcome_dashboard#index"
      devise_for :users,
        controllers: {
            sessions: "api/v1/users/sessions",
            confirmations: "api/v1/users/confirmations",
            omniauth_callbacks: "api/v1/users/omniauth_callbacks",
            passwords: "api/v1/users/passwords",
            unlocks: "api/v1/users/unlocks",
            registrations: "api/v1/users/registrations"
         }
    end
end
  ## Start routing for oauth callbacks
  # get 'users/auth/:provider/callback', to: "sessions#create", as: "sign_in"
  # delete '/sign_out', to: "sessions#destroy", as: "sign_out"
  ## End routing for oauth callbacks, to "sessions#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

## Wanted to show routes in comments so there is a clear example to anyone viewing the repo what endpoints are currently supported

=begin
                     new_user_session GET      /api/v1/users/sign_in(.:format)                                                          api/v1/users/sessions#new {:format=>:json}
                         user_session POST     /api/v1/users/sign_in(.:format)                                                          api/v1/users/sessions#create {:format=>:json}
                 destroy_user_session GET      /api/v1/users/sign_out(.:format)                                                         api/v1/users/sessions#destroy {:format=>:json}
user_google_oauth2_omniauth_authorize GET|POST /api/v1/users/auth/google_oauth2(.:format)                                               api/v1/users/omniauth_callbacks#passthru {:format=>:json}
 user_google_oauth2_omniauth_callback GET|POST /api/v1/users/auth/google_oauth2/callback(.:format)                                      api/v1/users/omniauth_callbacks#google_oauth2 {:format=>:json}
     user_facebook_omniauth_authorize GET|POST /api/v1/users/auth/facebook(.:format)                                                    api/v1/users/omniauth_callbacks#passthru {:format=>:json}
      user_facebook_omniauth_callback GET|POST /api/v1/users/auth/facebook/callback(.:format)                                           api/v1/users/omniauth_callbacks#facebook {:format=>:json}
                    new_user_password GET      /api/v1/users/password/new(.:format)                                                     api/v1/users/passwords#new {:format=>:json}
                   edit_user_password GET      /api/v1/users/password/edit(.:format)                                                    api/v1/users/passwords#edit {:format=>:json}
                        user_password PATCH    /api/v1/users/password(.:format)                                                         api/v1/users/passwords#update {:format=>:json}
                                      PUT      /api/v1/users/password(.:format)                                                         api/v1/users/passwords#update {:format=>:json}
                                      POST     /api/v1/users/password(.:format)                                                         api/v1/users/passwords#create {:format=>:json}
             cancel_user_registration GET      /api/v1/users/cancel(.:format)                                                           api/v1/users/registrations#cancel {:format=>:json}
                new_user_registration GET      /api/v1/users/sign_up(.:format)                                                          api/v1/users/registrations#new {:format=>:json}
               edit_user_registration GET      /api/v1/users/edit(.:format)                                                             api/v1/users/registrations#edit {:format=>:json}
                    user_registration PATCH    /api/v1/users(.:format)                                                                  api/v1/users/registrations#update {:format=>:json}
                                      PUT      /api/v1/users(.:format)                                                                  api/v1/users/registrations#update {:format=>:json}
                                      DELETE   /api/v1/users(.:format)                                                                  api/v1/users/registrations#destroy {:format=>:json}
                                      POST     /api/v1/users(.:format)                                                                  api/v1/users/registrations#create {:format=>:json}
                   rails_service_blob GET      /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
            rails_blob_representation GET      /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
                   rails_disk_service GET      /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
            update_rails_disk_service PUT      /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
                 rails_direct_uploads POST     /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create
=end
