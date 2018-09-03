require 'rails_helper'

describe Venue, type: :model do
  context "relationships" do
  it { should belong_to :locality }
  it { should have_many :users }
  it { should have_many :events }
  end
end
