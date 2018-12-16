class Api::V1::Users::DashboardController < ApplicationController
  before_action :verify_jwt_token

  def show
  end

  def index
    require "pry"; binding.pry
    render json: current_user.bands
    render json: current_user.venues
    require "pry"; binding.pry
  end
end
