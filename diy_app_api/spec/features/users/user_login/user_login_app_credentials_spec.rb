require 'rails_helper'

describe Api::V1::Users::SessionsController, type: :request do

  let(:user) { create :user }
    context "App Credentials" do

    it "user is rejected without any credentials" do
      post "/api/v1/users/sign_in", :params => nil

      expect(response.status).to eq 200
    end

    it "user can log in with password + username" do
      post "/api/v1/users/sign_in", :params => { email: "#{user.email}", password: "#{user.password}", username: "#{user.username}" }
      token = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(token['user_email']).to eq(user.email)
      expect(token['username']).to eq(user.username)
    end

    it "user gets unauthorized status with wrong password" do
      post "/api/v1/users/sign_in", :params => { email: "#{user.email}", password: "this is totally wrong" }

      expect(response.body).to eq " "
    end
  end
end
