class Api::V1::Bands::MyVenuesDashboardController < ApplicationController
  # before_action :verify_jwt_token

  def index
    current_user.venues.each do |venue|
      render json: { user_venues_links: venue_path(venue.id) }
    end
  end
end
