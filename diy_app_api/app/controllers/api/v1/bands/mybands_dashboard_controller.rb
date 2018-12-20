class Api::V1::Bands::MyBandsDashboardController < ApplicationController
  before_action :verify_jwt_token

  def index
    render json: { user_band_links: current_user.bands }
  end
end
