require 'rails_helper'

describe Api::V1::WelcomeDashboardController, type: :request do
  xit "url confirmation" do
    get "/api/v1/"

    expect(response).to redirect_to root_path
  end
end
