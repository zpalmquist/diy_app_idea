require 'rails_helper'

describe Api::Users::SessionsController, type: :request do
  let(:user) { create :user }
    context "App Credentials" do

    it "user is rejected without any credentials" do
      post "/api/users/sign_in", :params => nil

      expect(response.status).to eq 401
    end

    it "user can log in with password + username" do
      post "/api/users/sign_in", :params => { email: "#{user.email}", password: "#{user.password}" }
      token = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(token['user_email']).to eq(user.email)
      expect(token['username']).to eq(user.username)
    end

    it "user gets unauthorized status with wrong password" do
      post "/api/users/sign_in", :params => { email: "#{user.email}", password: "this is totally wrong" }

      expect(response.status).to eq 401
    end
  end
end
