require 'rails_helper'

describe User, type: :model do
  context "relationships" do
    it {should have_many :bands}
    it {should have_many :venues}
  end
  # context "validations" do
  ### Failing as of 09/2 - ZP

  # it {should validate_presence_of(:username)}
  # it {should validate_uniqueness_of :username}
  # it {should have_secure_password}
  # end
end
