require 'rails_helper'

describe Api::V1::Venues::VenuesController, type: :request do
  context "as an authorized user" do
    let(:user) { create(:user) }
    let(:venue) { create(:venue) }

    it "I can see my own venues page" do
      user.venues << venue
      token = login_as(user,
        params: {
          email: "#{user.email}",
          password: "#{user.password}"
        }
      )

      get "/api/v1/venues/#{venue.id}"

      content = JSON.parse(response.body)
      
    end
  end
end
