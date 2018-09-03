require 'rails_helper'

describe Event, type: :model do
  let(:venue) { create(:venue) }
  let(:event) { create(:event, venue: venue) }
  context "relationships" do
    it { should have_many :bands }
    it { should belong_to :venue }
  end
  context "validations" do
    it "is valid with valid attributes" do
      expect(event).to be_valid
    end
  end
end
