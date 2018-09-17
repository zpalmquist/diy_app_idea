class Devise::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.valid_password?(params[:password])
      render json: user.as_json(only: [:id, :email, :username]), status: :created
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
