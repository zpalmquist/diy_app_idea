class Api::V1::Users::DashboardController < ApplicationController
  before_action :verify_jwt_token

  def index
    render json: {
      my_bands_dashboard_link: band_dashboard_path(current_user),
      my_venues_dashboard_link: venue_dashboard_path(current_user)
    }
  end
end
