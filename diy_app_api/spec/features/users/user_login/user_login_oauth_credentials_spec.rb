require 'rails_helper'

def stub_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.add_mock(:google, {
    provider: "google",
    uid: "12345",
    info: {
      email: "test@google.com",
      first_name: "kyle",
      last_name: "sallette",
      image: "something.jpg"
    },
    credentials: {
      token: "123e45",
      refresh_token: "34534232",
      expires_at: DateTime.now
    }
    })
end

describe Api::V1::Users::OmniauthCallbacksController, type: :request do
  let(:user) { create(:user) }
  context "Oauth Credentials" do

    xit "user can log in with facebook credentials" do
      post "/api/v1/users/auth/google_oauth2", params: stub_omniauth

      expect(response.status).to eq 200
    end
  end
end
