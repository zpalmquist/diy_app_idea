class Api::V1::Bands::MyVenuesDashboardController < ApplicationController
  before_action :verify_jwt_token

  def index
    render json: { user_venue_links: current_user.venues.each do |venue|
                              venue_path(venue.id)
                            end
                 }
  end
end
