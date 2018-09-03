require 'rails_helper'

## Just as a note, I'm using state to show what administrative_area
## really represents. Could also be called a territory, province, etc.

describe AdministrativeArea, type: :model do
  before(:example) do
    @state ||= create(:administrative_area)
    @country ||= create(:country)
  end
  context "relationships" do
    it {should have_many :localities}
    it {should belong_to :country}
    it {should validate_presence_of :name}
    it {should validate_uniqueness_of(:name).case_insensitive}
  end
  context "validations" do
    it "is valid with valid attributes" do
      expect(@state).to be_valid
    end
    it "is not valid without a country" do
      state = AdministrativeArea.new(name: "CO", country: nil)
      expect(state).to_not be_valid
    end
    it "is not valid without a name" do
      state = AdministrativeArea.new(name: nil, country: @country)
      expect(state).to_not be_valid
    end
  end
end
