class ApplicationController < ActionController::API
  include ActionController::RequestForgeryProtection

  require 'auth_token'

  protect_from_forgery with: :exception, unless: -> { request.format.json? }

  protected

  def verify_jwt_token
    head :unauthorized if request.headers['Authorization'].nil? ||
      !AuthToken.valid?(request.headers['Authorization'].split(' ').last)
  end
end
