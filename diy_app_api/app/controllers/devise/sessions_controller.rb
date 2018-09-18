class Devise::SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:session][:email])
    auth = request.env["omniauth.auth"]
    # require "pry"; binding.pry
    session[:omniauth] = auth
    if user && (user.valid_password?(params[:password]) || user.sign_in_from_omniauth(auth))
      render json: user.as_json(only: [:id, :email, :username]), status: :created
      Rails.logger.info("You did it!")
    else
      head :unauthorized
    end
  end

  def destroy
    session.clear
  end

  def configure_sign_in_params
  end
end
