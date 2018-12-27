require 'rails_helper'

describe Api::V1::Users::DashboardController, type: :request do

  context "guest" do
    it "gets 401 error" do
      users = create_list(:user, 5)

      get "/api/v1/#{users[0].username}/dashboard"

      expect(response.status).to eq 401
    end

    context "user" do

      xit "gets access to the dashboard" do
        user = create(:user)
        login_as(user, { password: "#{user.password}", email: "#{user.email}"} )

        request.headers.merge! headers

        assert(AuthToken.valid?(headers['jwt-token']))

        get "/api/v1/#{user.username}/dashboard", :headers => headers['jwt-token']

        expect(response.status).to eq 200
      end
    end
  end
end
