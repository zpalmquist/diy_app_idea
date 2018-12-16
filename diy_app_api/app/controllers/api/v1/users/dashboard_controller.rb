class Api::V1::Users::DashboardController < ApplicationController
  before_action :verify_jwt_token

  def show
  end
end
