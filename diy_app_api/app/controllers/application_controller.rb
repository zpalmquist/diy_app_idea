class ApplicationController < ActionController::API

  # Allows protect from forgery method
  include ActionController::RequestForgeryProtection

  # Auth token module in the /lib directory
  require 'auth_token'

  protect_from_forgery unless: -> { request.format.json? }

  protected

  def verify_jwt_token
    head :unauthorized if request.headers['Authorization'].nil? ||
      !AuthToken.valid?(request.headers['Authorization'].split(' ').last)
  end
end
