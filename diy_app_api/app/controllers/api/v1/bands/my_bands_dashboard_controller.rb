class Api::V1::Bands::MyBandsDashboardController < ApplicationController
  # before_action :verify_jwt_token

  def index
      current_user.bands.each do |band|
        render json: { user_band_links: band_path(band.id) }
    end
  end
end
