class Api::V1::Bands::MyVenuesDashboardController < ApplicationController
  before_action :verify_jwt_token

  def index
    render json: { user_venues: current_user.venues }
  end
end
