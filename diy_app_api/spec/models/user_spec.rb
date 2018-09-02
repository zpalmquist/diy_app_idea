require 'rails_helper'

describe User, type: :model do
  it {should have_many_and_belong_to_many :bands}
  it {should have_many_and_belong_to_many :venues}
  it {should validate_presence_of :username}
  it {should validate_uniqueness_of :username}
  it {should have_secure_password}
end
