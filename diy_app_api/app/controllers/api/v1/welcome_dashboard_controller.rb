class Api::V1::WelcomeDashboardController < ApplicationController
  def index
      render json: { message: "Welome to this conceptual app API. Hope that your frontend can consume me \"Nom\"",
                   login_prompt: "Please create a form for me so the user can log in with regular email + password \n
                   or use an Oauth2 provider. We currently support Facebook + Google."}
  end
end
