class Event < ApplicationRecord
  belongs_to :venue

  has_many :band_events
  has_many :bands, through: :band_events
end
