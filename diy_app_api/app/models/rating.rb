class Rating < ApplicationRecord
  has_many :band_ratings
  has_many :bands, through: :band_ratings

  has_many :venue_ratings
  has_many :venues, through: :venue_ratings


end
