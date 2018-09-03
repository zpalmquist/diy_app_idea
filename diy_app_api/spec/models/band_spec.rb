require 'rails_helper'

describe Band, type: :model do
  context "relationships" do
  it {should have_many :users}
  it {should have_many :events}
  it {should belong_to :locality}
  it {should validate_presence_of :name}
  end
end
