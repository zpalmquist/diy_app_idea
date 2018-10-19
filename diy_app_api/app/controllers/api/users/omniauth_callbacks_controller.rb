class Api::Users::OmniauthCallbacksController < ApplicationController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth
  def all
    user = User.create_user_from_omniauth(request.env["omniauth.auth"])
    if user.persisted?
      sign_in_and_redirect user
    else
      failure
    end
  end

  def failure
    redirect_to new_user_registration_url
  end

  alias_method :facebook, :all
  alias_method :google_omniauth2, :all
  # alias_method :soundcloud, :all
end
