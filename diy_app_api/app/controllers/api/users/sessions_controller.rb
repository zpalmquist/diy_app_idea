class Api::Users::SessionsController < Devise::SessionsController
  # Import encoding/decoding JWT logic
  require 'auth_token'

  # Disable CSRF protection
  skip_before_action :verify_authenticity_token

  # Enable JSON
  respond_to :html, :json

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    auth = request.env["omniauth.auth"]
    if user && (user.valid_password?(params[:password]) || (user.sign_in_from_omniauth(auth) if !auth.nil?))
      warden.set_user(user, scope: :user)
      sign_in(user)

      # Issue JWT to JS Client
      token = AuthToken.issue_token({ user_id: user.id})

        # Insert JWT inside header
        response.set_header('jwt-token', token)

        respond_with user, location: after_sign_in_path_for(user) do |format|
          format.json { render json: { user_email: user.email, username: user.username, token: token } }
        end
    else
      head :unauthorized
    end
    #TODO: Should redirect to a profile page once authorized
  end

  # DELETE /resource/sign_out
  def destroy
    # Not sure how to handle JWT 'logout' yet
  end
end
