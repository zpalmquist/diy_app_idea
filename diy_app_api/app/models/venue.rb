class Venue < ApplicationRecord
  belongs_to :locality

  has_many :user_venues
  has_many :users, through: :user_venues

  has_many :venue_events
  has_many :events, through: :venue_events

  has_one_attached :profile_pic
end
