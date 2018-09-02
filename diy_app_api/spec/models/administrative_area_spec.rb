require 'rails_helper'

describe AdministrativeArea, type: :model do
  it {should have_many :localities}
  it {should belong_to :country}
  it {should validate_presence_of :name}
  it {should validate_uniqueness_of :name}
end
