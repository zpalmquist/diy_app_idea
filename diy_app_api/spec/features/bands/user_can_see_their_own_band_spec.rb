require 'rails_helper'

describe Api::V1::Bands::BandsController, type: :request do
    context "as an authorized user" do
      let(:user) { create(:user) }
      let(:band) { create(:band) }

    xit "I can see my own bands page" do
      user.bands << band
      login_as(user,
        params: {
          email: "#{user.email}",
          password: "#{user.password}"
        }
      )

      get "/api/v1/bands/#{band.id}"

      content = JSON.parse(response.body)

      refute(resonse['band_info']).nil?
      expect(response['band_info']).is_a?(String)
    end
  end
end
