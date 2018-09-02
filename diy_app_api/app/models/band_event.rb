## Joins that exists to tie bands to events

class BandEvent < ApplicationRecord
  belongs_to :band
  belongs_to :event
end
