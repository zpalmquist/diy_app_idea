require 'rails_helper'

describe VenueEvent, type: :model do
  it {should belong_to :event}
  it {should belong_to :venue}
end
