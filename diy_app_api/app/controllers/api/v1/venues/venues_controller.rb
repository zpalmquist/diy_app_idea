class Api::V1::Venues::VenuesController < ApplicationController
  before_action :verify_jwt_token

  def show
  end

  def index
    # should only be viewable as app admin
    render json: { venues: Venue.all }
  end

  def create
    venue = Venue.new(venue_params)
    venue.save
    if venue.save!
      render :show
    else
      render json: { message: "Please try again" }
    end
  end

  def update
    venue = Venue.find_by(params[:id])
    venue.update(venue_params)
    if venue.update!
      redirect_to venue_path(venue)
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def venue_params
    params[:venue].permit(:name, :locality)
  end
end
