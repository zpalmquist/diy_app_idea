require 'rails_helper'

describe Api::V1::Users::DashboardController, type: :request do

  context "guest" do
    it "gets 401 error" do
      users = create_list(:user, 5)

      get "/api/v1/#{users[0].username}/dashboard"

      expect(response.status).to eq 401
    end
  end
end
