require 'rails_helper'

# If so, you can explicitly tell Devise which mapping to use:
# @request.env["devise.mapping"] = Devise.mappings[:user]

describe Api::Users::SessionsController, type: :controller do
  let(:user) { create :user }

    context "App Credentials" do
    it "user can log in with password + username" do
      params = { email: "#{user.email}",
                 password: "#{user.password}"
      }
      require "pry"; binding.pry
      post :create, params
      expect.response.to_be :successful
    end
  end
end
