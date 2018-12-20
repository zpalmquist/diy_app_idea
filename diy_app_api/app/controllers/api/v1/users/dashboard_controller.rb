class Api::V1::Users::DashboardController < ApplicationController
  before_action :verify_jwt_token

  def index
    render json: {
      my_bands_dashboard_link: all_bands_dashboard_path(current_user.username),
      my_venues_dashboard_link: all_venues_dashboard_path(current_user.username)
    }
  end
end
