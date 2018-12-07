class Api::Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # Disable CSRF protection
  skip_before_action :verify_authenticity_token

  ;
  def all
    ;
    user = User.sign_in_from_omniauth(request.env["omniauth.auth"])
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
  alias_method :google_oauth2, :all
  # alias_method :soundcloud, :all
end
