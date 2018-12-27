require 'rails_helper'

describe Api::V1::Bands::BandsController, type: :request do
    context "as an authorized user" do
      let(:user) { create(:user) }
      let(:band) { create(:band) }

    it "I can see my own bands page" do
      user.bands << band
      login_as(user,
        params: {
          email: "#{user.email}",
          password: "#{user.password}"
        }
      )

      get "/api/v1/bands/#{band.name.strip}"
      expect(page).to have_content(band.name)
    end
  end
end
