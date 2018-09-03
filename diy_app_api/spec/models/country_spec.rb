require 'rails_helper'

describe Country, type: :model do
  context "relationships" do
  it {should have_many :administrative_areas}
  end
end
