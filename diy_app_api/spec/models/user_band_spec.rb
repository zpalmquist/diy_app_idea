require 'rails_helper'

describe UserBand, type: :model do
  context "relationships" do
    it {should belong_to :user}
    it {should belong_to :band}
  end
end
