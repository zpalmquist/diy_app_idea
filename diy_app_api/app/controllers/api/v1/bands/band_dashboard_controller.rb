class Api::V1::Bands::BandDashboardController < ApplicationController
  before_action :verify_jwt_token

  def show
    render json: { band: current_user.bands.find_by(params[:id])  }
  end
end
