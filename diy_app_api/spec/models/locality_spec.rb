require 'rails_helper'

describe Locality, type: :model do
  context "relationships" do
  it {should have_many :venues}
  it {should belong_to :administrative_area}
  end
end
