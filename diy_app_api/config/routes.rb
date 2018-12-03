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

=begin
                     new_user_session GET      /api/users/sign_in(.:format)                                                             api/users/sessions#new {:format=>:json}
                         user_session POST     /api/users/sign_in(.:format)                                                             api/users/sessions#create {:format=>:json}
                 destroy_user_session GET      /api/users/sign_out(.:format)                                                            api/users/sessions#destroy {:format=>:json}
user_google_oauth2_omniauth_authorize GET|POST /api/users/auth/google_oauth2(.:format)                                                  api/users/omniauth_callbacks#passthru {:format=>:json}
 user_google_oauth2_omniauth_callback GET|POST /api/users/auth/google_oauth2/callback(.:format)                                         api/users/omniauth_callbacks#google_oauth2 {:format=>:json}
     user_facebook_omniauth_authorize GET|POST /api/users/auth/facebook(.:format)                                                       api/users/omniauth_callbacks#passthru {:format=>:json}
      user_facebook_omniauth_callback GET|POST /api/users/auth/facebook/callback(.:format)                                              api/users/omniauth_callbacks#facebook {:format=>:json}
                    new_user_password GET      /api/users/password/new(.:format)                                                        api/users/passwords#new {:format=>:json}
                   edit_user_password GET      /api/users/password/edit(.:format)                                                       api/users/passwords#edit {:format=>:json}
                        user_password PATCH    /api/users/password(.:format)                                                            api/users/passwords#update {:format=>:json}
                                      PUT      /api/users/password(.:format)                                                            api/users/passwords#update {:format=>:json}
                                      POST     /api/users/password(.:format)                                                            api/users/passwords#create {:format=>:json}
             cancel_user_registration GET      /api/users/cancel(.:format)                                                              api/users/registrations#cancel {:format=>:json}
                new_user_registration GET      /api/users/sign_up(.:format)                                                             api/users/registrations#new {:format=>:json}
               edit_user_registration GET      /api/users/edit(.:format)                                                                api/users/registrations#edit {:format=>:json}
                    user_registration PATCH    /api/users(.:format)                                                                     api/users/registrations#update {:format=>:json}
                                      PUT      /api/users(.:format)                                                                     api/users/registrations#update {:format=>:json}
                                      DELETE   /api/users(.:format)                                                                     api/users/registrations#destroy {:format=>:json}
                                      POST     /api/users(.:format)                                                                     api/users/registrations#create {:format=>:json}
                   rails_service_blob GET      /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
            rails_blob_representation GET      /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
                   rails_disk_service GET      /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
            update_rails_disk_service PUT      /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
                 rails_direct_uploads POST     /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create
=end
