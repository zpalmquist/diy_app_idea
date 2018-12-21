require 'rails_helper'

describe Api::V1::Bands::BandsController, type: :request do
    before(:all) do
      login_as(user, params => { email: "#{user.email}",
                                 password: "#{user.password}"
                                 }
                               )
                               context "as an authorized user" do
      let(:user) { create(:user) }
      let(:band) { create(:band) }
      require "pry"; binding.pry
    end
    it "I can see my own bands page" do
      get "/api/v1/bands/#{band.name}"

      expect(page).to have_content(band.name)
    end
  end
end
