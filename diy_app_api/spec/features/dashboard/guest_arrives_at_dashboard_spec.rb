require 'rails_helper'

describe Api::V1::WelcomeDashboardController, type: :request do
  it "url confirmation" do
    get "/"

    content = JSON.parse(response.body)

    expect content["message"].is_a?(String)
  end
end
