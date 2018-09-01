class AddVenueReferenceToVenues < ActiveRecord::Migration[5.2]
  def change
    add_reference :venue_ratings, :venue, foreign_key: true
  end
end
