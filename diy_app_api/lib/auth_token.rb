require 'jwt'

# Some logic to create token attributes and check against existing tokens

module AuthToken
  def self.issue_token(payload)
    payload['exp'] = 12.hours.from_now.to_i
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end

  def self.valid?(token)
    begin
      JWT.decode(token, Rails.application.secrets.secret_key_base)
    rescue
      false
    end
  end
end
