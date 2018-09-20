# frozen_string_literal: true

class Api::V1::SessionsController < ApplicationController
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    user = User.find_by(email: params[:email])
    auth = request.env["omniauth.auth"]
    session[:omniauth] = auth
    if user && (user.valid_password?(params[:password]) || user.sign_in_from_omniauth(auth))
      require "pry"; binding.pry
      render json: user.as_json(only: [:id, :email, :username]), status: :created
    else
      head :unauthorized
    end
  end
  # DELETE /resource/sign_out
  def destroy
    super
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
