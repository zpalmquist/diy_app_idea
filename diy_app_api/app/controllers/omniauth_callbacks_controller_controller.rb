class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    user = User.create_user_from_omniauth(request.env["omniauth.auth"])
    if user.persisted?
      sign_in_and_redirect user, notice: "Signed In!"
    else
      session["devise.user.attributes"] = user.attributes
      redirect_to new_user_registration_url
    end
  end
  
  alias_method :facebook, :all
  alias_method :google, :all
  alias_method :soundcloud, :all
end
