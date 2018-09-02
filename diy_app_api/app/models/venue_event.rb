class VenueEvent < ApplicationRecord
  belongs_to :event
  belongs_to :venue
end
