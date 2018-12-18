class Api::V1::Users::SessionsController < Devise::SessionsController
  # Auth token module in the /lib directory
  require 'auth_token'

  # Disable CSRF protection
  skip_before_action :verify_authenticity_token

  # Enable JSON
  respond_to :html, :json

  def new
    render json: { message: "Welome to this conceptual app API. Hope that your frontend can consume me \"Nom\"",
                   login_prompt: "Please create a form for me so the user can log in with regular email + password \n
                   or use an Oauth2 provider. We currently support Facebook + Google."}
  end

  def create
    user = User.find_by(email: params[:email])
    auth = request.env["omniauth.auth"]
    if user && (user.valid_password?(params[:password]) || (user.sign_in_from_omniauth(auth) if !auth.nil?))
      warden.set_user(user, scope: :user)
      sign_in(user)

      # Issue JWT to JS Client
      token = AuthToken.issue_token({ user_id: user.id, username: user.username})

        # Insert JWT inside header
        response.set_header('jwt-token', token)

        render json: { user_email: user.email, username: user.username, token: token }
    else
      render :new
    end
  end

  # DELETE /resource/sign_out
  def destroy
    # Not sure how to handle JWT 'logout' yet
  end
end
