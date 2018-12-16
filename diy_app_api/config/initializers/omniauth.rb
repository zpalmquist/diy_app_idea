## This contains the omniauth config for future iterations of the application
## May not need below code as config/devise.rb can also hold this logic and may work better for our enviro



# OmniAuth.config.logger = Rails.logger
# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_SECRET_ID'],
#   { client_options: {
#     ssl: {
#       ca_file: Rails.root.join("cacert.pem").to_s
#     }
#   }
# }
# provider :facebook, ENV['FACEBOOK_CLIENT_ID'], ENV['FACEBOOK_SECRET_ID'],
# { client_options: {
#    ssl: {
#      ca_file: Rails.root.join("cacert.pem").to_s
#        }
#      }
#  }
# provider :soundcloud, 'ENV[soundcloud_key]', ''
# end
