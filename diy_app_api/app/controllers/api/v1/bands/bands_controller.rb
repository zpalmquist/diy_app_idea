class Api::V1::Bands::BandsController < ApplicationController
  before_action :verify_jwt_token  

  def show
  end

  def index
    render json: { bands: Band.all }
  end

  def create
    band = Band.new(band_params)
    band.save
    if band.save!
      redirect_to band_dashboard_path(band)
    else
      render json: { message: "Please try again" }
    end
  end

  def update
    band = Band.find_by(params[:id])
    band.update(band_params)
    if band.update!(band_params)
      redirect_to band_path(band)
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def band_params
    params[:band].permit(:name, :locality)
  end
end
