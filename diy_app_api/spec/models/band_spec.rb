require 'rails_helper'

describe Band, type: :model do
    let(:city) { create :locality }
    let(:band) { create :band, locality: city }
  context "relationships" do
    it { should have_many :users }
    it { should have_many :events }
    it { should belong_to :locality }
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of(:name).case_insensitive }
  end
  context "validations" do
    it "is valid with valid attributes" do
      expect(band).to be_valid
    end
    it "is not valid without a city" do
      band.locality = nil
      expect(band).to_not be_valid
    end
    it "is not valid without a name" do
      band.name = nil
      expect(band).to_not be_valid
    end
    it "is not valid if another band has the same name" do
      band2 = Band.create(name: band.name, locality: city)
      expect(band2).to_not be_valid
    end
  end
end
