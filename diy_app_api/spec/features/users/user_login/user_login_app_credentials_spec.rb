require 'rails_helper'
# include Devise::ControllerHelpers
# If so, you can explicitly tell Devise which mapping to use:
# @request.env["devise.mapping"] = Devise.mappings[:user]

describe Api::Users::SessionsController, type: :controller do
  let(:user) { create :user }
    context "App Credentials" do
    it "user can log in with password + username" do
      pending "Need to finish"
    end
  end
end
