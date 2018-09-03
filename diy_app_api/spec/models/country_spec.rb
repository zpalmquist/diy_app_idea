require 'rails_helper'

describe Country, type: :model do
  let(:country) { create(:country) }
  context "relationships" do
    it {should have_many :administrative_areas}
  end
  context "validations" do
    it "is valid with valid attributes" do
      expect(country).to be_valid
    end
    it "is not valid with no name" do
      country.name = nil
      expect(country).to_not be_valid
    end
    it "is not valid if country name already exists" do
      duplicate_country = Country.new(name: country.name.upcase)
      expect(duplicate_country).to_not be_valid
    end
  end
end
