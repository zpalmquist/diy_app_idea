class UserOmniauthCredential < ApplicationRecord
  belongs_to :user

  ## Completely cover if user updates any fields and handle Oauth all in one
  def update_or_create(attributes)
    if user.nil?
      create_user(attributes)
    else
      user.update_attributes(attributes)
    end
    user
  end
end
