class Api::V1::Users::DashboardController < ApplicationController
  before_action :verify_jwt_token

  def index
    render json: {
      bands: current_user.bands, venues: current_user.venues
    }
  end
end
