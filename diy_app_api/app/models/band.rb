class Band < ApplicationRecord
  # This is a new ActiveStorage thing
  has_one_attached :profile_pic

  has_many :user_bands
  has_many :users, through: :user_bands

  has_many :band_events
  has_many :events, through: :band_events

  belongs_to :locality

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
