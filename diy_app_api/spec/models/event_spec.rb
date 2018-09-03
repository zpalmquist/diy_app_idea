require 'rails_helper'

describe Event, type: :model do
  context "relationships" do
  it {should have_many :bands}
  it {should belong_to :venue}
  end
end
