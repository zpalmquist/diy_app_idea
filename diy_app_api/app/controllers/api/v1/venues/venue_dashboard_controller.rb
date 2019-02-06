class Api::V1::Venues::VenueDashboardController < ApplicationController
  # before_action :verify_jwt_token

  def show
    render json: { venue: current_user.venues.find_by(params[:id]) }
  end
end
