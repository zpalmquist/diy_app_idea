require 'rails_helper'

describe BandEvent, type: :model do
  context "relationships" do
  it {should belong_to :band}
  it {should belong_to :event}
  end
end
