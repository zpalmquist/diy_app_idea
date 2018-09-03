require 'rails_helper'

describe UserVenue, type: :model do
  context "relationships" do
    it { should belong_to :user }
    it { should belong_to :venue }
  end
end
