class UserAppCredentials < ApplicationRecord
  belongs_to :user
  has_secure_password
  validates_presence_of :password
end
