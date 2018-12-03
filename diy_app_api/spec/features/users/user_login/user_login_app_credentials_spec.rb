require 'rails_helper'
# include Devise::ControllerHelpers
# If so, you can explicitly tell Devise which mapping to use:
# @request.env["devise.mapping"] = Devise.mappings[:user]

describe Api::Users::SessionsController, type: :request do
  let(:user) { create :user }
    context "App Credentials" do

    it "user can log in with password + username" do
      post "/api/users/sign_in", :params => { email: "#{user.email}", password: "#{user.password}" }

      expect(response.status).to eq 200
    end
  end
end
