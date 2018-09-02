class Band < ApplicationRecord
  has_one_attached :profile_pic

  has_many :user_bands
  has_many :users, through: :user_bands

  has_many :band_events
  has_many :events, through: :band_events

  belongs_to :locality
end
