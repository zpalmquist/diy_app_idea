class UserAppCredential < ApplicationRecord
  belongs_to :user
  validates_presence_of :encrypted_password
end
