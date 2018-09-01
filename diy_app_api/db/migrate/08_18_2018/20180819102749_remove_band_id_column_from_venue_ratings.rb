class RemoveBandIdColumnFromVenueRatings < ActiveRecord::Migration[5.2]
  def change
    remove_column :venue_ratings, :band_id, :big_int
  end
end
