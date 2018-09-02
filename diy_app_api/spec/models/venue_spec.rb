require 'rails_helper'

describe Venue, type: :model do
  it {should have_many_and_belong_to_many :users}
  it {should have_many :events}
  it {should belong_to :locality}
end

# does an event belong to a venue, or what is the relationship
# an event won't have many venues
# an event WILL have many bands
# an event will belong to a venue

### localities ###
# a venue should only belong to locality, as locality will belong
# to an administrative area and an administrative area will belong
# to a country
