class CreateVenueRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :venue_ratings do |t|
      t.references :rating, foreign_key: true
      t.references :band, foreign_key: true

      t.timestamps
    end
  end
end
